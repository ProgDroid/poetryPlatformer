/// transitionIn()


var transitions = getMenuTransitions();
script_execute(asset_get_index(transitions[? TRANSITION_HANDLE_IN]));

menuController.menuCursorAction = emptyScript;

