/// transitionOut(string nextMenu)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on transitionOut: " + string(argument_count));
    exit;
}

menuController.nextMenu = argument0;

var transitions = getMenuTransitions();
script_execute(asset_get_index(transitions[? TRANSITION_HANDLE_OUT]));

