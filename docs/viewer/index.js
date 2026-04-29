const page=document.getElementById('page');
const title=document.getElementById('title');

const urlParams=new URLSearchParams(window.location.search);
var rawlink=urlParams.get('link'); //what md file to view
var pagename=urlParams.get('pagename'); //title of md file
if (pagename!=null){
    title.textContent=pagename;
}


var link=(rawlink || "README.md").trim().replace(/^\/+/, "");  // default README.md & remove / at start of any links

const base = new URL(
  "https://raw.githubusercontent.com/Astralsparv/Picotron-Wiki/refs/heads/main/"
);

try {
    const parsed=new URL(link, base);

    if (parsed.protocol!=="http:" && parsed.protocol!=="https:") {
        throw new Error("Supported protocols: http/https");
    }
    
    link = parsed.href;
} catch (e) {
    console.error("Invalid URL:", e);
}
if (!link.endsWith(".md")) {
    window.open(link, "_blank");
}

function dirname(url) {
    if (url==null){ url="README.md" };
    return url.substring(0, url.lastIndexOf('/') + 1);
}

marked.use({
    gfm: true,
    pedantic: false
});

fetch(link)
    .then(response => {
    if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
    }
        return response.text();
    })
    .then(md => {
        md=md.replace(/^[\u200B\u200C\u200D\u200E\u200F\uFEFF]/,"");
        let giturl=link.toString();
        giturl=giturl.replace('https://raw.githubusercontent.com/Astralsparv/Picotron-Wiki/refs/heads/main/','https://github.com/Astralsparv/Picotron-Wiki/blob/main/');
        md=`[Open this page in Github](${giturl})\n\n`+md;
        page.innerHTML=marked.parse(md);
        let a=page.getElementsByTagName('a');
        for (let i=0; i<a.length; i++){
            let href = a[i].getAttribute('href');

            if (!href) continue;

            if (
                href.startsWith('#') ||
                href.startsWith('http')
            ) continue;
            if (href.endsWith("/")){ // is readme.md
                href=href + "readme.md";
            }
            if (href.endsWith(".md")){ // is md file; should be rendered through page
                href=href.replace(/^\/+/, "");
                let url = new URL("/Picotron-Wiki/viewer/", window.location.origin);
                let base=rawlink||""
                url.searchParams.set('link', dirname(base)+'/'+href);
                url.searchParams.set('pagename',href.split('/').pop().replace(/\.md$/, ""));

                a[i].href=url.href;
            }else{
                a[i].href=new URL(href, "https://raw.githubusercontent.com/Astralsparv/Picotron-Wiki/refs/heads/main/" + dirname(rawlink)).href;
            }
        }

        Prism.languages.lua = Prism.languages.extend('lua', {});
        // Picotron API functions (from 0.3.0c)
        Prism.languages.insertBefore('lua', 'function', {
            'api-function': {
                pattern: /\b(flr|pset|select|set_spr|vec|set|map|reset|palt|userdata|poke8|get_spr|get|cp|socket|foreach|t|create_process|pal|sspr|tokenoid|fillp|memset|norm|btn|assert|type|oval|create_undo_stack|error|poke2|theme|add|env|fetch_metadata|clear_key|pwf|menuitem|load|create_gui|on_event|sfx|mv|store|tonum|mouselock|pwd|music|print|memmap|store_metadata|tostring|time|pod|include|rect|date|stat|get_clipboard|peektext|split|pairs|unpod|readtext|key|getmetatable|camera|keyp|sgn|fset|mouse|tostr|notify|all|sub|rawlen|ord|mset|yield|pack|costatus|cocreate|min|ceil|rawequal|unmap|coresume|stop|peek2|unpack|printh|exit|memcpy|note|window|line|get_display|cursor|get_draw_target|open|pget|del|mid|spr|ipairs|vid|rawset|peek4|poke|deli|peek|btnp|pid|tonumber|circfill|rrectfill|max|set_draw_target|cd|mget|cls|mount|poke4|color|blit|fstat|atan2|collectgarbage|ls|setmetatable|rm|send_message|count|mkdir|create_delta|cos|rawget|circ|clip|flip|next|peek8|fetch|wrangle_working_file|tline3d|rectfill|srand|set_clipboard|fget|sqrt|warn|pcall|fullpath|chr|apply_delta|rnd|ovalfill|abs|sin|rrect|goto)\b/,
                alias: 'api-function'
            }
        });
        Prism.highlightAll();
    })
    .catch(error => {
        alert("Houston, we got a problem. See console for error logs")
        console.error('Error processing MD file:', error);
    }
);