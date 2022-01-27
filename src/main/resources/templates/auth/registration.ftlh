<!DOCTYPE html>
<html lang="en">
<#import "/spring.ftl" as spring />
<head>
    <title>Registration</title>
</head>
<body>

<div id="mes">

</div>

<div><label> Login: <input id="name" type="text" name="username"/> </label></div>
<div><label> Password: <input id="pas" type="password" name="password"/> </label></div>

<button type="button" onclick="reg()">reg</button>

<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script>
    async function reg() {
        console.log('hello')
        let obj = {
            "username": $('#name').val(),
            "password": $('#pas').val()
        };

        let response = await fetch('/registration', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(obj)
        });

        if (response.ok) {
            window.location.replace('/login');
        } else {
            $('#mes').append('<p>name exist</p>');
        }
    }


</script>
</body>
</html>