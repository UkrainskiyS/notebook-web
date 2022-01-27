<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#import "/spring.ftl" as spring />
    <link href="<@spring.url 'bootstrap/css/bootstrap.css' />" rel="stylesheet" />
    <title>Note Book</title>
</head>
<body class="bg-light">

<div class="container">

    <div style="padding-top: 15em;">
        <p class="h1 text-center text-primary">Note Book</p>
        <p class="h4 text-center">Registration</p>

        <div class="d-flex justify-content-center">
            <form class="col-3 g-3 needs-validation" novalidate>
                <div class="row">
                    <label for="login" class="form-label"></label>
                    <input type="text" class="form-control form-control-lg" id="login" placeholder="Login" required>
                    <div class="invalid-feedback">
                        Please input login!
                    </div>
                </div>
                <div class="row">
                    <label for="password" class="form-label"></label>
                    <input type="password" class="form-control form-control-lg" id="password" placeholder="Password" required>
                    <div class="invalid-feedback">
                        Please input password!
                    </div>
                </div>

                <div class="d-flex justify-content-center">
                    <div class="" style="padding-top: 15px">
                        <button class="btn btn-primary" onclick="reg()" type="submit">Register</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="empty" aria-hidden="true" aria-labelledby="empty1" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content text-center">
                <div class="modal-header text-danger">
                    <h5 class="modal-title" id="empty1">Failure!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    This login is busy!
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- JS -->
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="<@spring.url '/bootstrap/js/bootstrap.js'/>"></script>
<script src="<@spring.url '/js/registration.js'/>"></script>
<script src="https://unpkg.com/showdown/dist/showdown.min.js"></script>
<script>
    (function () {
        'use strict'

        const forms = document.querySelectorAll('.needs-validation');

        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>