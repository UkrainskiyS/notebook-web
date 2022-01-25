/**
 * DELETE NOTE
 * @param note
 * @param mode
 * @returns {Promise<void>}
 */
async function deleteNote(note, mode) {
    await fetch('/api/note/delete?' + new URLSearchParams({
        id: note
    }))
        .then(function () {
            if (mode === "all") {
                window.location.replace('/note/all');
            } else {
                window.location.replace('/note/group?group=' + mode);
            }
        });
}

/**
 * UPDATE NOTE
 * @param note
 * @returns {Promise<void>}
 */
async function updateNote(note) {
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
        new bootstrap.Modal($('#success')).show(true);
    }
}
