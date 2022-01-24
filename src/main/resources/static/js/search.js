/**
 * GENIUS SEARCH
 */
function searches() {
    let input = $('#search').val().toUpperCase();
    let groups = document.getElementById("elements").getElementsByClassName('searches');

    for (let i = 0; i < groups.length; i++) {
        let a = groups[i].getElementsByClassName("element_name")[0];
        let txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(input) > -1) {
            groups[i].style.display = "";
        } else {
            groups[i].style.display = "none";
        }
    }
}