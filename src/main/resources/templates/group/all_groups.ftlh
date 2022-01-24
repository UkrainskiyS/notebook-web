<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
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
                <li class="active"><a href="<@spring.url '/group/all'/>">GROUPS</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

    <#-- DESCRIPTION AND BUTTON NEW GROUP -->
    <#if groups?size != 0>
        <ul class="row">
            <button data-target="modal1" class="col s2 right btn modal-trigger" onclick="$('#modal_body').remove(); createGroup()">new group</button>
            <div class="input-field col s6 center">
                <label for="search"></label><input type="text" id="search" onkeyup="searches()" placeholder="Search for names..">
            </div>
        </ul>
        <#else>
            <ul class="row">
                <button data-target="modal1" class="col s2 offset-s5 btn modal-trigger" onclick="$('#modal_body').remove(); createGroup()">new group</button>
            </ul>
    </#if>

    <#-- LIST GROUPS -->
        <ul id="elements" class="row">
            <#list groups as group>
                <li>
                    <div class="col s12 m6">
                        <div class="card grey lighten-5">
                            <div class="card-content black-text">
                                <span class="element_name card-title">${group.name?upper_case}</span>
                            </div>
                            <div class="card-action">
                                <a class="teal-text" href="<@spring.url '/note/group?group=${group.id}'/>">NOTES</a>
                                <a class="red-text" href="#" onclick="deleteGroup(${group.id})">DELETE</a>
                            </div>
                        </div>
                    </div>
                </li>
            </#list>
        </ul>

    <#-- MODAL FOR BUTTON NEW -->
    <div id="modal1" class="modal"></div>
</div>
<script src="<@spring.url '/js/search.js'/>"></script>
<script src="<@spring.url '/js/groups.js'/>"></script>
<script src="<@spring.url '/js/script.js'/>"></script>
<script src="<@spring.url '/js/main.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    M.AutoInit(undefined);
</script>
</body>
</html>