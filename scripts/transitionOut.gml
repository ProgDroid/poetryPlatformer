/// transitionOut(string transitionHandle, int transitionDirection, string nextMenu)

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on transitionOut: " + string(argument_count));
    exit;
}

inputController.startAction    = emptyScript;

menuController.nextMenu                = argument2;
menuController.menuTransitionDirection = argument1;

var transitions = getMenuTransitions();
script_execute(asset_get_index(transitions[? argument0]));

