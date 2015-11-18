// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
    setTimeout(updateContents, 5000);
});

function updateContents() {
    var contents = $(".contents");
    if (contents.length == 0)  return;

    var stream_id = contents.attr("data-id");
    var after = $(".content:last-child").attr("data-time");
    $.getScript(stream_id + "/contents.js?after=" + after);
    setTimeout(updateContents, 5000);
}

$(document).on('change', '.btn-file :file', function () {
    console.log("method called");
    var input = $(this);
    var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $("input[name='content[data]']").val(label);
    $("input[type='submit']").focus();
});
