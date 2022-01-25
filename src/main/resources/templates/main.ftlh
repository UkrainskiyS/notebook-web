<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#import "/spring.ftl" as spring />
    <link href="<@spring.url 'bootstrap/css/bootstrap.css' />" rel="stylesheet" />
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
            <a class="nav-link text-light" href="<@spring.url '/note/all'/>">NOTES</a>
            <a class="nav-link text-light" href="<@spring.url '/group/all'/>">GROUPS</a>
        </div>
    </div>
</nav>
</div>
</nav>

<!-- LAST 10 NOTES -->
<div class="container">
    <p class="h3 text-center" style="padding-top: 25px;">Last ten notes</p>

    <#list notes as note>
        <div class="accordion" style="padding-top: 10px;" id="accordionPanelsStayOpenExample${note.id}">
            <div class="accordion-item collapsible">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne${note.id}">
                    <button id="btn${note_index}" class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${note.id}" aria-expanded="true" aria-controls="collapse${note.id}">
                        <span class="text-primary" style="white-space: pre">${note.group.name?upper_case}: </span>${note.name}
                    </button>
                </h2>
                <div id="collapse${note.id}" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne${note.id}">
                    <div id="${note_index}" class="accordion-body"></div>
                </div>
            </div>
        </div>

        <span id="test${note_index}" style="display: none">${note.text}</span>
    </#list>
</div>
<!-- JS -->
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="<@spring.url '/js/main.js'/>"></script>
<script>refactor(${notes?size})</script>
</body>
</html>