/// newMenu(string newMenu)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on changeResolution: " + string(argument_count));
    exit;
}

ds_stack_push(menuController.previousMenus, menuController.currentMenu);
ds_stack_push(menuController.previousSelectedOptions, menuController.currentOption);

menuController.currentMenu            = argument0;
menuController.nextMenu               = noone;
menuController.currentOption          = 0;

var lengths = getMenuLineLengths();
menuController.underlineHalfLengthMax = lengths[| menuController.currentOption];

var options = getMenuOptions();
menuController.menuOptionCount = ds_list_size(options);

var transitions = getMenuTransitions();
script_execute(transitionIn(transitions[? TRANSITION_HANDLE_IN]));

menuController.menuGUI = asset_get_index(getMenuDraw());

transitionIn();
