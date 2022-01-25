/**
 * DELETE GROUP
 * @param group
 * @returns {Promise<void>}
 */
async function deleteGroup(group) {
    await fetch('/api/group/delete?' + new URLSearchParams({
        id: group
    }))
        .then(function () {
            window.location.replace('/group/all')
        });
}

/**
 * CREATE GROUP
 * @returns {Promise<void>}
 */
async function create() {
    let object = {
        name: $('#name_new_group').val(),
        description: $('#description').val()
    };

    console.log(object.name);
    console.log(object.description);

    if (object.name.trim().length > 0) {
        $('#modal_body').remove();
        let response = await fetch('/api/group/new', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(object)
        });

        if (response.ok) {
            window.location.replace('/group/all');
        } else {
            groupExist();
        }
    }
}

function groupExist() {
    const myModal = new bootstrap.Modal(document.getElementById('exampleModalToggle2'))
    myModal.show(true);
}