/// selectMenuOption

if (inputController.menuAccept) {
    var menuActionList = getMenuActions();

    script_execute(asset_get_index(menuActionList[| menuController.currentOption]));
    return 0;
}

if (inputController.menuBack) {
    menuGoBack();
    return 0;
}

