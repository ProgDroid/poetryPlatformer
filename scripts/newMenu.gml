/// newMenu(string newMenu)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on newMenu: " + string(argument_count));
    exit;
}

var handle = "";
var menu   = argument0;
var option = 0;

if (menuController.menuTransitionDirection == transitionDirection.up) {
    handle = TRANSITION_HANDLE_BACK_IN;

    menu   = ds_stack_pop(menuController.previousMenus);
    option = ds_stack_pop(menuController.previousSelectedOptions);
} else if (menuController.menuTransitionDirection == transitionDirection.down) {
    handle = TRANSITION_HANDLE_IN;

    ds_stack_push(menuController.previousMenus, menuController.currentMenu);
    ds_stack_push(menuController.previousSelectedOptions, menuController.currentOption);
}

menuController.currentMenu            = menu;
menuController.nextMenu               = noone;
menuController.currentOption          = option;
menuController.underlineAnimTime      = 0;
menuController.underlineHalfLength    = 0;

var lengths = getMenuLineLengths();
menuController.underlineHalfLengthMax = lengths[| menuController.currentOption];

var options = getMenuOptions();
menuController.menuOptionCount = ds_list_size(options);

menuController.menuGUI = asset_get_index(getMenuDraw());

transitionIn(handle);
