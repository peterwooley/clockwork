var cw = {};

cw.dialog = function() {
    var $editor = $("#editor");
    
    if(!$editor.length) {
        $("<div />")
            .append($("<pre />").attr("id", "editor").text("function() {}").css({width: "90%", height:"90%"}))
            .appendTo("body")
            .dialog({title:"Ace is the Place!", minHeight: 400, minWidth: 750});
        
        var editor = ace.edit("editor");
        editor.setTheme("ace/theme/textmate");
    } else {
        if($editor.is(":visible")) {
            $editor.parent().dialog('close');
        } else {
            $editor.parent().dialog('open');
        }
    }
};

$(function() {
    $("<button />")
        .text("Editor!")
        .click(cw.dialog)
        .appendTo("body");
});