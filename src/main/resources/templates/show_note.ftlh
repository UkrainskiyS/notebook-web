<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" xmlns:form="http://www.w3.org/1999/html">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<style>
    #test {
        display: none;
    }
    p {
        padding: 15px;
    }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<#import "/spring.ftl" as spring />
<head>
    <meta charset="UTF-8">
    <title>Edit note</title>
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
    <h3 class="center-align"><span class="teal-text text-lighten-2">Edit note</span></h3>

    <form class="col s12" action="">
        <div class="row">
            <div class="input-field col s12">
                <label for="group">Group</label><input disabled value="${note.group.name}" id="group" type="text">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input disabled value="${note.name}" id="name" type="text" class="validate"><label for="name">Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input disabled value="${note.dateTime}" id="date" type="text" class="validate"><label for="date">Last update</label>
            </div>
        </div>
        <div class="col s12">
            <p class="z-depth-1" id="text"></p>
        </div>
    </form>

    <div class="row">
        <a class="col s1 waves-effect waves-light btn" href="<@spring.url '/note/edit?note=${note.id}'/>">edit</a>
        <a class="col s1 waves-effect waves-light btn red offset-s9" onclick="history.back();">back</a>
    </div>
    <span id="test">${note.text}</span>

</div>
<script src="<@spring.url '/js/notes.js'/>"></script>
<script src="<@spring.url '/js/main.js'/>"></script>
<script src="<@spring.url '/js/new_note.js'/>"></script>
<script src="<@spring.url '/js/script.js'/>"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<#--<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>-->
<script>
    getMark();
</script>
</body>
</html>
