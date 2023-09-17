///incrementAndWrapMenuBind()

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on incrementAndWrapMenuBind: " + string(argument_count));
    exit;
}

var bind      = menuController.currentBind;
var bindCount = TOTAL_KEYBINDS;

bind += argument0;
bind = bind % bindCount + (bindCount * (bind < 0));

return bind;

