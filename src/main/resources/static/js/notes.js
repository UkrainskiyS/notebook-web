async function deleteNote(note) {
    await fetch('/api/note/delete?' + new URLSearchParams({
        id: note
    }))
        .then(function () {
            window.location.replace('/note/all')
        });
}