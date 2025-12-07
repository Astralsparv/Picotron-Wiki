/*

Modified merge sort algorithm, source by geeksforgeeks.org
https://www.geeksforgeeks.org/javascript/javascript-program-for-merge-sort/
*/

/* v https://www.geeksforgeeks.org/javascript/javascript-program-for-merge-sort/ v */

function merge(arr, left, middle, right) {
    // Length of both sorted aub arrays
    let l1 = middle - left + 1;
    let l2 = right - middle;
    // Create new subarrays
    let arr1 = new Array(l1);
    let arr2 = new Array(l2);
    
    // Assign values in subarrays
    for (let i = 0; i < l1; ++i) {
        arr1[i] = arr[left + i];
    }
    for (let i = 0; i < l2; ++i) {
        arr2[i] = arr[middle + 1 + i];
    }

    // To travesrse and modify main array
    let i = 0,
        j = 0,
        k = left;
        
    // Assign the smaller value for sorted output
    while (i < l1 && j < l2) {
        if (arr1[i].score < arr2[j].score) {
            arr[k] = arr1[i];
            ++i;
        } else {
            arr[k] = arr2[j];
            j++;
        }
        k++;
    }
    // Update the remaining elements
    while (i < l1) {
        arr[k] = arr1[i];
        i++;
        k++;
    }
    while (j < l2) {
        arr[k] = arr2[j];
        j++;
        k++;
    }
}

// Function to implement merger sort in javaScript
function mergeSort(arr, left, right) {
    if (left >= right) {
        return;
    }

    // Middle index to create subarray halves
    let middle = left + parseInt((right - left) / 2);

    // Apply mergeSort to both the halves
    mergeSort(arr, left, middle);
    mergeSort(arr, middle + 1, right);

    // Merge both sorted parts
    merge(arr, left, middle, right);
}

/* ^ https://www.geeksforgeeks.org/javascript/javascript-program-for-merge-sort/ ^ */

let db=[]

const headerScore=3
const headerLevelDepreciation=0.8
const contentLevelDepreciation=0.8
const contentScore=1
const urlScore=2

function escapeRegex(str){
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function searchSection(section, queryList) {
    let score = 0;

    for (const query of queryList) {
        const q = escapeRegex(query);

        const header = section.text.toLowerCase();
        const matchesHeader = header.match(new RegExp(q, "g"));
        let headerScoreFactor=headerScore;
        let contentScoreFactor=contentScore;
        if (section.level>1){
            headerScoreFactor=headerScoreFactor*headerLevelDepreciation**(section.level-1);
            contentScoreFactor=contentScoreFactor*contentLevelDepreciation**(section.level-1);
        }
        if (matchesHeader){
            score+=matchesHeader.length*headerScoreFactor;
        }

        const content = section.content.join(" ").toLowerCase();
        const matchesContent = content.match(new RegExp(q, "g"));
        if (matchesContent){
            score+=matchesContent.length*contentScoreFactor;
        }
    }

    for (const child of section.children) { //search sub sections
        score+=searchSection(child, queryList);
    }

    return score;
}

function search(q){
    q=q.toLowerCase()
    let finds=[]
    let words=q.split(' ');
    let queryList=[];
    words.forEach(word => {
        if (word.endsWith("s")) { // assume plurality
            let singular = word.slice(0, -1);
            if (!queryList.includes(singular)) {
                queryList.push(singular); // singular
            }
        }else{
            if (!queryList.includes(word)){
                queryList.push(word);
            }
        }
    });
    q=queryList[0]
    for (const entry of db){
        const path=entry.path;
        const data=entry.data;
        let score=0;
        for (const section of data){
            score+=searchSection(section,queryList);
        }
        //let parts=path.split("/");
        //parts=parts.slice(-2);
        //const title=`${parts[0]}/${parts[1]}`;
        let title=path;
        title=title.substring(1,title.length);

        const matchesPath = path.match(new RegExp(q, "g"));
        if (matchesPath){
            score+=matchesPath.length*urlScore;
        }

        if (score>0){
            finds.push({path:path,score:score,title:title});
        }
    }
    mergeSort(finds,0,finds.length-1);
    pushResults(finds,q);
}

fetch('db.json')
    .then(response => {
    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }
        return response.json(); // Parse the response body as JSON
    })
    .then(jsonData => {
        db=jsonData;
        const urlParams=new URLSearchParams(window.location.search);
        var q=urlParams.get('q');
        if (q!=null){
            search(q);
            document.getElementById('query').value=q;
            document.getElementById('footer').classList="footer smaller";
        }
    })
    .catch(error => {
        console.error('Error fetching JSON:', error);
    }
);


// query string stuff

function openQuery(event){
    event.preventDefault();
    const query = document.getElementById('query').value;
    window.open(`?q=${encodeURIComponent(query)}`, '_self'); 
}