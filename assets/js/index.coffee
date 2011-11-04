            window.cw = {}

            window.cw.dialog = ->
                $editor = $ "#editor";
                
                if not $editor.length
                    $("<div />")
                        .append($("<pre />").attr("id", "editor").text("addObject()").css(width: "90%", height:"90%"))
                        .append($("<button />").text("Run CoffeeScript").click( -> eval CoffeeScript.compile window.cw.editor.getSession().getValue() ) )
                        .appendTo("body")
                        .dialog(title:"Ace is the Place!", minHeight: 400, minWidth: 750);
                    
                    window.cw.editor = ace.edit "editor"
                    window.cw.editor.setTheme "ace/theme/textmate"
                else
                    if $editor.is ":visible"
                        $editor.parent().dialog('close');
                    else
                        $editor.parent().dialog('open');

            $ ->
                $("<button />")
                    .text("Editor!")
                    .click(cw.dialog)
                    .appendTo("body")


