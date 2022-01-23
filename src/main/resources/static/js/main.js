async function searchNote() {
    await fetch('/api/search?' + new URLSearchParams({
        note: $('#search').val()})
    )
        .then(function (response) {
        return response.json();
    })
        .then(function (data) {
            console.log('data', data);
        });
}

function createGroup() {
    $('#modal1').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content"></div><div id="modal3" class="modal-footer"></div>');
    $('#modal2').append('<h4 class="center-align">Enter the name of the new group!</h4><form id="input" class="input-field center-align"></form>');
    $('#input').append('<label for="name">Name group</label><input id="name_new_group" type="text">')
    $('#modal3').append('<a onclick="check()" class="modal-close waves-effect waves-green btn-flat">Save</a>');
}

async function check() {
    let response = await fetch('/api/group/new', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify({name: $('#name_new_group').val()})
    });

    $('#modal_body').remove();

    if (response.ok) {
        success();
    } else {
        // badRequest()
    }
}

function success() {
    $('#modal1').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content"></div><div id="modal3" class="modal-footer"></div>');
    $('#modal2').append('<h4 class="center-align">Success!</h4><p class="center-align">Note successfully saved!</p>');
    $('#modal3').append('<a class="modal-close waves-effect waves-green btn-flat">Agree</a>');
}

