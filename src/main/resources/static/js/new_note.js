async function getMessage() {
    $('#123').remove();
    $('#modal_body').remove();

    let object = {
        'group': $('#group').val(),
        'name': $('#name').val(),
        'text': simplemde.value()
    };

    if (object.group == null || object.name.trim().length === 0) {
        emptyInput();
        return;
    }

    let response = await fetch('/note/new', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(object)
    });

    if (response.ok) {
        messageOk();
    } else if (response.status === 400) {
        nameExist();
    } else {
        serverError();
    }
}

/**
 * SUCCESS MESSAGE
 */
function messageOk() {
    $('#modal1').removeClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content"></div><div id="modal3" class="modal-footer"></div>');
    $('#modal2').append('<h4 class="center-align">Success!</h4><p class="center-align">Note successfully saved!</p>');
    $('#modal3').append('<a class="modal-close waves-effect waves-green btn-flat">Agree</a>')
        .append('<a href="/" id="save" class="modal-close waves-effect waves-green btn-flat">Home page</a>');
}

/**
 * FAILURE
 */
function nameExist() {
    $('#modal1').addClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content white-text"></div><div id="modal3" class="modal-footer red white-text"></div>');
    $('#modal2').append('<h4 class="center-align">Name exist!</h4><p class="center-align">A note with the same name already exists in the selected group.</p>');
    $('#modal3').append('<a class="modal-close waves-effect waves-green btn-flat white-text">Agree</a>');
}

function serverError() {
    $('#modal1').addClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content white-text"></div><div id="modal3" class="modal-footer red white-text"></div>');
    $('#modal2').append('<h4 class="center-align">Server error!</h4><p class="center-align">Please, reload this page.</p>');
    $('#modal3').append('<a class="modal-close waves-effect waves-green btn-flat white-text">Agree</a>');
}

function emptyInput() {
    $('#modal1').addClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content white-text"></div><div id="modal3" class="modal-footer red white-text"></div>');
    $('#modal2').append('<h4 class="center-align">Empty input!</h4><p class="center-align">You need to fill in the fields group and name.</p>')
    $('#modal3').append('<a class="modal-close waves-effect waves-green btn-flat white-text">Agree</a>');
}
