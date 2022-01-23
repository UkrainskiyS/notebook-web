<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<#import "/spring.ftl" as spring />
<link rel="stylesheet" href="<@spring.url '/css/text.css'/>">
<head>
    <meta charset="UTF-8">
    <title>Note book</title>
</head>
<body>
<#-- SHAPKA -->
<nav>
    <div class="nav-wrapper teal row">
        <div class="container">
            <a href="/" class="brand-logo">Note book</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="<@spring.url '/note/new'/>">NEW</a></li>
                <li><a href="<@spring.url '/note/all'/>">NOTES</a></li>
                <li><a href="<@spring.url '/group/all'/>">GROUPS</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <h3 class="center-align"><span class="teal-text text-lighten-2">Last 10 notes</span></h3>
    <ul class="collapsible expandable">
        <#list notes as note>
            <li>
                <div class="collapsible-header"><span class="teal-text text-lighten-2">${note.group.name}</span>: ${note.name}</div>
                <div class="collapsible-body"><p id="note_text">${note.text}</p></div>
            </li>
        </#list>
    </ul>

</div>
<script src="<@spring.url '/js/script.js'/>"></script>
<script src="<@spring.url '/js/main.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    M.AutoInit(undefined);
    const elem = document.querySelector('.collapsible.expandable');
    const instance = M.Collapsible.init(elem, {
        accordion: false
    });
</script>
</body>
</html>