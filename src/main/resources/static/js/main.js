function refactor(size) {
    let converter = new showdown.Converter();
    // converter.setFlavor('github');

    for (let i = 0; i < size; i++) {
        let text = document.getElementById('test' + i).textContent;
        $('#test' + i).remove();
        $('#' + i).html(converter.makeHtml(text));
    }
}

function converter() {
    let converter = new showdown.Converter();
    converter.setFlavor('github');

    let text = document.getElementById('test').textContent;
    $('#test').remove();
    $('#text').html(converter.makeHtml(text));
}


