/// menuGoBack()

if (ds_stack_empty(menuController.previousMenus)) {
    return 0;
}

var menu = ds_stack_top(menuController.previousMenus);

var currentMenu = menuController.currentMenu;

if (currentMenu == MENU_HANDLE_SET && ds_map_size(settingsController.changedSettings) > 0) {
    menuConfirmation(TRANSITION_HANDLE_BACK_OUT, menu, "do you want to save the settings?#select no to revert all changes", transitionDirection.up, transitionDirection.up);
    exit;
}

transitionOut(TRANSITION_HANDLE_BACK_OUT, transitionDirection.up, menu);

