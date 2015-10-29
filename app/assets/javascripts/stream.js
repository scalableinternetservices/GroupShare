// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
    if (($("#allstreams").length > 0)) {
        updateStreams();
    }
});

function updateStreams(){
    var after = $(".stream:first-child").attr("data-time");
    $.getScript("streams?after="+after);
    setTimeout(updateStreams, 5000);
}
