async function reg() {
    let obj = {
        "username": $('#login').val(),
        "password": $('#password').val()
    };

    let response = await fetch('/registration', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(obj)
    });

    if (response.ok) {
        // window.location.replace('/');
        console
    } else {
        new bootstrap.Modal($('#empty')).show(true);
    }
}