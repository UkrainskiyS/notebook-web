<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" xmlns:form="http://www.w3.org/1999/html">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<#import "/spring.ftl" as spring />
<head>
    <meta charset="UTF-8">
    <title>Create note</title>
</head>
<body>
<#-- SHAPKA -->
<nav>
    <div class="nav-wrapper teal">
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

<#-- REDACTOR -->
<div class="container">
    <h3 class="center-align"><span class="teal-text text-lighten-2">Create note</span></h3>

    <form class="input-field col s12" action="">
    <p><label>
        <select name="group" id="group">
            <option value="" disabled selected>Choose your group</option>
            <#list groups as group_name>
                <option value="${group_name}">${group_name}</option>
            </#list>
        </select>
    </label></p>
    <div class="input-field col s6">
        <label for="name">Name</label><input id="name" type="text">
    </div>
    <p><label><textarea id="text" name="text"></textarea></label></p>
    </form>

    <div class="row">
        <a class="col s2 waves-effect waves-light btn modal-trigger" href="#modal1" onclick="getMessage()">Save</a>
        <a class="col s1 waves-effect waves-light btn red offset-s9" href="/">home page</a>
    </div>

    <div id="modal1" class="modal red"></div>
</div>
<script src="<@spring.url '/js/main.js'/>"></script>
<script src="<@spring.url '/js/new_note.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
<script>
    let simplemde = new SimpleMDE();
    M.AutoInit(undefined);
    $(document).ready(function() {
        $('select').formSelect();
    });
</script>
</body>
</html>
