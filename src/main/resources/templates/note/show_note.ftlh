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
    <div class="mb-3">
        <label for="gr" class="form-label">Group</label>
            <input id="gr" class="form-control" type="text" value="${note.group.name}" disabled readonly>
    </div>
    <div class="mb-3">
        <label for="nm" class="form-label">Name note</label>
            <input id="nm" class="form-control" type="text" value="${note.name}" disabled readonly>
    </div>

    <div id="text" class="border" style="padding: 15px"></div>
    <span id="test" style="display: none">${note.text}</span>

    <div class="row" style="padding: 20px 0">
        <a class="btn btn-secondary col-1 offset-1" href="<@spring.url '/note/edit?note=${note.id}'/>" role="button">EDIT</a>
        <a class="btn btn-danger col-1 offset-8" href="" onclick="deleteNote(${note.id}, 'all')" role="button">DELETE</a>
    </div>
</div>
<!-- JS -->
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="<@spring.url '/js/groups.js'/>"></script>
<script src="<@spring.url '/js/notes.js'/>"></script>
<script src="<@spring.url '/js/main.js'/>"></script>
<script>converter()</script>
</body>
</html>