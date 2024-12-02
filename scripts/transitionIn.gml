/// transitionIn(string transitionHandle)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on transitionIn: " + string(argument_count));
    exit;
}

var transitions = getMenuTransitions();
script_execute(asset_get_index(transitions[? argument0]));

menuController.menuCursorAction = emptyScript;

