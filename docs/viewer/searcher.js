// query string stuff

function openQuery(event){
    event.preventDefault();
    const query = document.getElementById('query').value;
    window.open(`../?q=${encodeURIComponent(query)}`, '_self'); 
}