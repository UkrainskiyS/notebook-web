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
                </div>
            </div>
        </nav>
    </div>
</nav>

<div class="container" style="padding-top: 30px">
    <div class="row">

    <!-- SEARCH AND BUTTON NEW GROUP -->
        <#if groups?size != 0>
        <div class="col-6">
            <input id="search" onkeyup="searches()" class="form-control form-control-lg" type="text" placeholder="Search for names.." aria-label=".form-control-lg example">
        </div>
        <div class="col-6">
            <button class="btn btn-primary btn-lg offset-9" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">NEW GROUP</button>
        </div>
        <#else>
           <div class="col-12">
               <button class="btn btn-primary btn-lg offset-5" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">NEW GROUP</button>
           </div>
        </#if>
    </div>

<!-- LIST NOTES -->
<div id="elements" class="row" style="padding-top: 20px">
    <#list groups as group>
    <div class="col-4 searches" style="padding: 10px 10px">
        <div class="card">
            <h5 class="element_name card-header text-center">${group.name?upper_case}</h5>
            <div class="card-body">
                <#if group.description??>
                     <p class="card-text">${group.description}</p>
                    <#else>
                        <p class="card-text"></p>
                </#if>
                <div class="text-center row">
                    <div class="col-6">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                NOTES
                            </button>
                            <#if group.notes??>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <#list group.notes as note>
                                        <li><a class="dropdown-item" href="<@spring.url '/note/show?note=${note.id}' />">${note.name}</a></li>
                                    </#list>
                                </ul>
                            </#if>
                        </div>
                    </div>
                    <a href="#" class="btn btn-danger col-3 offset-2" onclick="deleteGroup(${group.id})">DELETE</a>
                </div>
            </div>
        </div>
    </div>
    </#list>
</div>


    <#-- MODALS -->
    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New group</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="name_new_group" class="col-form-label">Name:</label>
                            <input  type="text" class="form-control" id="name_new_group">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="col-form-label">Description:</label>
                            <textarea class="form-control" id="description"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" data-bs-dismiss="modal" onclick="create()" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center">
                <div class="modal-header text-danger">
                    <h5 class="modal-title" id="exampleModalToggleLabel2">Name exist!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    A group with that name already exists!
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script src="<@spring.url '/js/groups.js'/>"></script>
<script src="<@spring.url '/js/search.js'/>"></script>
</body>
</html>