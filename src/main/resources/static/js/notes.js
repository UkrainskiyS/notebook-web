/**
 * DELETE NOTE
 * @param note
 * @returns {Promise<void>}
 */
async function deleteNote(note) {
    await fetch('/api/note/delete?' + new URLSearchParams({
        id: note
    }))
        .then(function () {
            window.location.replace('/note/all')
        });
}

/**
 * UPDATE NOTE
 * @param note
 * @returns {Promise<void>}
 */
async function updateNote(note) {
    $('#modal_body').remove();
    let response = await fetch('/api/note/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify({
            id: note,
            text: simplemde.value()
        })
    });

    if (response.ok) {
        messageOk();
    }
}

function messageOk() {
    $('#modal1').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content"></div><div id="modal3" class="modal-footer"></div>');
    $('#modal2').append('<h4 class="center-align">Success!</h4><p class="center-align">Note successfully updated!</p>');
    $('#modal3').append('<a href="/note/all" id="save" class="modal-close waves-effect waves-green btn-flat">ALL NOTES</a>')
        .append('<a class="modal-close waves-effect waves-green btn-flat">Agree</a>')
        .append('<a href="/" id="save" class="modal-close waves-effect waves-green btn-flat">Home page</a>');
}