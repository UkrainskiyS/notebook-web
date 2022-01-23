/**
 * GENIUS SEARCH
 */
function searchGroup() {
    let input = $('#search').val().toUpperCase();
    let groups = document.getElementById("groups").getElementsByTagName('li');

    for (let i = 0; i < groups.length; i++) {
        let a = groups[i].getElementsByClassName("group_name")[0];
        let txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(input) > -1) {
            groups[i].style.display = "";
        } else {
            groups[i].style.display = "none";
        }
    }
}

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
    };

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

function createGroup() {
    $('#modal1').removeClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content"></div><div id="modal3" class="modal-footer"></div>');
    $('#modal2').append('<h4 class="center-align">New group</h4><form id="input" class="center-align"></form>');
    $('#input').append('<div class="input-field"><label for="name_new_group">Name</label><input required id="name_new_group" type="text"></div>')
    $('#modal3').append('<a onclick="create()" class="waves-effect waves-green btn-flat">Save</a>')
        .append('<a class="modal-close waves-effect waves-green btn-flat">cancel</a>');
}

function groupExist() {
    $('#modal1').addClass('red').append('<div id="modal_body"></div>');
    $('#modal_body').append('<div id="modal2" class="modal-content white-text"></div><div id="modal3" class="modal-footer red white-text"></div>');
    $('#modal2').append('<h4 class="center-align">Group with this name exist!</h4>');
    $('#modal3').append('<a onclick="$(\'#modal_body\').remove(); createGroup()" class="waves-effect waves-green btn-flat white-text">Agree</a>');
}