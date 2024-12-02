/// newMenu(string newMenu)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on newMenu: " + string(argument_count));
    exit;
}

var handle = "";
var menu   = argument0;
var option = 0;

if (menuController.currentMenu == MENU_HANDLE_CONFIRMATION && ds_stack_top(menuController.previousMenus) != MENU_HANDLE_MAIN) {
    var _ = ds_stack_pop(menuController.previousMenus);
    _     = ds_stack_pop(menuController.previousSelectedOptions);
}

if (menuController.menuTransitionDirection == transitionDirection.up) {
    handle = TRANSITION_HANDLE_BACK_IN;

    menu   = ds_stack_pop(menuController.previousMenus);
    option = ds_stack_pop(menuController.previousSelectedOptions);
} else if (menuController.menuTransitionDirection == transitionDirection.down) {
    handle = TRANSITION_HANDLE_IN;

    if (menuController.currentMenu != MENU_HANDLE_CONFIRMATION) {
        ds_stack_push(menuController.previousMenus, menuController.currentMenu);
        ds_stack_push(menuController.previousSelectedOptions, menuController.currentOption);
    }

    if (menu == MENU_HANDLE_MAIN) {
        ds_stack_clear(menuController.previousMenus);
        ds_stack_clear(menuController.previousSelectedOptions);
    }
}

menuController.currentMenu            = menu;
menuController.nextMenu               = noone;
menuController.currentOption          = option;
menuController.underlineAnimTime      = 0;
menuController.underlineHalfLength    = 0;
menuController.currentBind            = 0;

var lengths = getMenuLineLengths();
menuController.underlineHalfLengthMax = lengths[| menuController.currentOption];

menuController.subMenuUnderlineHalfLength    = 0;
menuController.subMenuUnderlineHalfLengthMax = lengths[| menuController.currentOption];
menuController.subMenuUnderlineAnimTime      = 0;

menuController.subMenuValueUnderlineHalfLength    = 0;
menuController.subMenuValueUnderlineAnimTime      = 0;

var options = getMenuOptions();
menuController.menuOptionCount = ds_list_size(options);

menuController.menuGUI = asset_get_index(getMenuDraw());

transitionIn(handle);
