function getMark(text) {
    let converter = new showdown.Converter();
    converter.setFlavor('github');
    $('#text').append('<span>' + converter.makeHtml($('#test').text()) + '</span>');
}