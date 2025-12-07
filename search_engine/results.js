const container=document.getElementById('results');

function clearChildren(node){
    while (node.lastElementChild) {
        node.removeChild(node.lastElementChild);
    }
}

function pushResults(results,query){
    clearChildren(container);
    if (results.length>0){
        var h2=document.createElement('h2');
        h2.textContent=`${results.length} results`;
        container.appendChild(h2);
    }else{
        var h2=document.createElement('h2');
        h2.innerHTML=`No results :c<br>Want to <a href="https://github.com/Astralsparv/Picotron-Wiki/blob/main/documenting.md">document it</a>?`;
        container.appendChild(h2);
    }
    for (i=results.length-1; i>0; i--){
        var result=document.createElement('div');
        result.classList='result';
        
        var title=document.createElement('a');
        title.textContent=results[i].title;
        title.href=`https://github.com/Astralsparv/Picotron-Wiki/tree/main${results[i].path}`
        title.classList='title';
        
        var relevance=document.createElement('p');
        relevance.textContent=`Relevance: ${Math.floor(results[i].score*100)/100}`;
        relevance.classList='relevance';

        result.appendChild(title);
        result.appendChild(relevance);
        container.appendChild(result);
    }
}