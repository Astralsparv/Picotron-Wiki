let db=[];

function ext(fn){
    return fn.split('.').pop();
}

function processContent(content){
    const lines=content.split("\n");
    const root=[];
    const stack=[];

    let currentLevel=0
    for (let line of lines){
        line=line.replace(/\r$/, "");
        const match=line.match(/^(#{1,6})\s+(.*)$/);
        if (match){
            // header
            const level=match[1].length;
            const text=match[2].trim();
            const node={
                level:level,
                text:text,
                content:[],
                children:[]
            }

            while (stack.length && stack[stack.length-1].level>=level) {
                stack.pop();
            }
            if (stack.length==0){
                root.push(node);
            }else{
                const parent=stack[stack.length-1];
                parent.children.push(node);
            }

            stack.push(node)
        }else{
            //just text
            if (stack.length>0){
                stack[stack.length-1].content.push(line)
            }
        }
    }
    return root
}

function cutFirstSegment(path){
    let parts=path.split("/");
    parts=parts.slice(-(parts.length));
    let str="";
    for (let i=1; i<parts.length; i++){
        str=`${str}/${parts[i]}`;
    }
    return str
}

function rip(){
    files=document.getElementById('wiki').files;
    db=[];
    let pending=0;
    for (let i=0; i<files.length; i++){
        let file=files[i];
        if (ext(file.name)=="md"){
            const reader=new FileReader()
            pending++;
            // reader is async
            reader.onload=function(e){
                db.push(
                    {
                        "name":file.name,
                        "path":cutFirstSegment(file.webkitRelativePath),
                        "data":processContent(e.target.result)
                    }
                )
                pending--;
                if (pending==0){
                    console.log(db);
                    const jsonString = JSON.stringify(db, null, 2);
                    const blob = new Blob([jsonString], { type: "application/json" });
                    const url = URL.createObjectURL(blob);
                    const a = document.createElement("a");
                    a.href = url;
                    a.download = "data.json";
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    URL.revokeObjectURL(url);
                }
            };
            reader.readAsText(file);
        }
    }
}