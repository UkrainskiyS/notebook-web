/**
 * SAVE MESSAGE
 * @returns {Promise<void>}
 */
async function getMessage() {
    let object = {
        'group': $('#group').val(),
        'name': $('#name').val(),
        'text': simplemde.value()
    };

    if (object.group == null || object.name.trim().length === 0) {
        new bootstrap.Modal($('#empty')).show(true);
        return;
    }

    let response = await fetch('/api/note/new', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(object)
    });

    if (response.ok) {
        new bootstrap.Modal($('#success')).show(true);
    } else if (response.status === 400) {
        new bootstrap.Modal($('#exist')).show(true);
    }
}
