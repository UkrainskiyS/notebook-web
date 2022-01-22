<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<#import "/spring.ftl" as spring />
<link rel="stylesheet" href="<@spring.url '/css/text.css'/>">
<head>
    <meta charset="UTF-8">
    <title>Note book</title>
</head>
<body>
<div class="container">

    <h3 class="center-align"><span class="teal-text text-lighten-2">Last 10 notes</span></h3>
    <ul class="collapsible">
        <#list notes as note>
            <li>
                <div class="collapsible-header"><span class="teal-text text-lighten-2">${note.group.name}</span>: ${note.name}</div>
                <div class="collapsible-body"><p id="note_text">${note.text}</p></div>
            </li>
        </#list>
    </ul>

</div>
<script>M.AutoInit(undefined);</script>
<script src="<@spring.url '/js/script.js'/>"></script>
</body>
</html>