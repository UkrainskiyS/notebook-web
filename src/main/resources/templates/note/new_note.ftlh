<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#import "/spring.ftl" as spring />
    <link href="<@spring.url '/bootstrap/css/bootstrap.css' />" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
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
                    <li class="nav-item dropdown">
                        <a class="nav-link text-warning dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            ${username}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="nav-link text-danger" href="<@spring.url '/login?logout'/>">LOGOUT</a>
                        </ul>
                    </li>
                </div>
            </div>
        </nav>
    </div>
</nav>

<div class="container" style="padding-top: 30px">
    <div class="mb-3">
        <label for="group" class="form-label">Group</label>
        <select id="group" class="form-select" aria-label="Default select example">
            <option selected >Open the group list</option>
            <#list groups as group>
                <option value="${group}">${group}</option>
            </#list>
        </select>
    </div>
    <div class="mb-3">
        <label for="name" class="form-label">Name note</label>
        <input id="name" placeholder="Input name note" class="form-control" type="text">
    </div>

    <div class="col-12"><label for="text"></label><textarea id="text" name="text"></textarea></div>

    <div class="row">
        <a class="btn btn-primary col-1 offset-1" onclick="getMessage()" href="#" data-bs-toggle="modal" role="button">SAVE</a>
        <a class="btn btn-danger col-1 offset-8" onclick="history.back();" role="button">CANCEL</a>
    </div>

<#-- MODAL -->
    <div class="modal fade" id="success" aria-hidden="true" aria-labelledby="success1" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center">
                <div class="modal-header text-success">
                    <h5 class="modal-title" id="success1">Saved!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Note successfully saved!
                </div>
                <div class="modal-footer">
                    <a class="btn btn-success" type="button" href="<@spring.url '/note/all'/>">OK</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="empty" aria-hidden="true" aria-labelledby="empty1" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center">
                <div class="modal-header text-danger">
                    <h5 class="modal-title" id="empty1">Empty input!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Please, select group and input name!
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exist" aria-hidden="true" aria-labelledby="exist1" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center">
                <div class="modal-header text-danger">
                    <h5 class="modal-title" id="exist1">Name exist!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    A note with that name already exists in selected group!
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JS -->
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="<@spring.url '/js/new_note.js'/>"></script>
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
<script>
    let simplemde = new SimpleMDE();
</script>
</body>
</html>