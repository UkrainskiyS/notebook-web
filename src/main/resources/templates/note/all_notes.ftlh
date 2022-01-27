<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#import "/spring.ftl" as spring />
    <link href="<@spring.url '/bootstrap/css/bootstrap.css' />" rel="stylesheet" />
    <title>Note Book</title>
</head>
<body>

<!-- HEADER -->
<nav class="navbar-primary bg-primary">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-primary bg-primary">
            <div class="container-fluid me-md-auto">
                <a class="navbar-brand text-light" href="/">Note Book</a>
                <div class="navbar-nav">
                    <a class="nav-link text-light" href="<@spring.url '/note/new'/>">NEW</a>
                    <a class="nav-link text-light active" href="<@spring.url '/note/all'/>">NOTES</a>
                    <a class="nav-link text-light" href="<@spring.url '/group/all'/>">GROUPS</a>
                    <a class="nav-link text-warning" href="<@spring.url '/login?logout'/>">LOGOUT</a>
                </div>
            </div>
        </nav>
    </div>
</nav>

<div class="container" style="padding-top: 30px">
    <div class="row">

        <#-- SEARCH AND BUTTON NEW GROUP -->
        <#if notes?size != 0>
            <div class="col-6">
                <input id="search" onkeyup="searches()" class="form-control form-control-lg" type="text" placeholder="Search for names.." aria-label=".form-control-lg example">
            </div>
            <div class="col-6">
                <a class="btn btn-primary btn-lg offset-9" href="<@spring.url '/note/new'/>" role="button">NEW NOTE</a>
            </div>
        <#else>
            <div class="col-12">
                <a class="btn btn-primary btn-lg offset-5" href="<@spring.url '/note/new'/>" role="button">NEW NOTE</a>
            </div>
        </#if>
    </div>

    <!-- LIST NOTES -->
    <div id="elements" class="row" style="padding-top: 20px">

        <#list notes as note>
            <div class="col-4 searches" style="padding: 10px 10px">
                <div class="card">
                    <h5 class="element_name card-header text-center">${note.name?upper_case}</h5>
                    <div class="card-body">
                        <h5 class="card-title"><span class="text-primary">GROUP:</span>${" " + note.group.name}</h5>
                        <p class="card-text"><span class="text-primary">LAST UPDATE:</span>${" " + note.dateTime}</p>
                        <div class="text-center">
                            <a href="<@spring.url '/note/show?note=${note.id}'/>" class="btn btn-primary col-3">SHOW</a>
                            <a href="<@spring.url '/note/edit?note=${note.id}'/>" class="btn btn-secondary col-3 offset-1">EDIT</a>
                            <a href="#" class="btn btn-danger col-3 offset-1" onclick="deleteNote(${note.id}, 'all')">DELETE</a>
                        </div>
                    </div>
                </div>
            </div>
        </#list>

    </div>
</div>
<!-- JS -->
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="<@spring.url '/js/notes.js'/>"></script>
<script src="<@spring.url '/js/search.js'/>"></script>
</body>
</html>