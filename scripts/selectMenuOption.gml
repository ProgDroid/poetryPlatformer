/// selectMenuOption

if (inputController.menuAccept) {
    var options = getMenuOptions();
    var menuActionList = getMenuActions();

    for (var i = 0; i < array_length_1d(menuController.menuDisabledEntries); ++i) {
        if (options[| menuController.currentOption] == menuController.menuDisabledEntries[i]) {
            return 0;
        }
    }

    script_execute(asset_get_index(menuActionList[| menuController.currentOption]));
    return 0;
}

if (inputController.menuBack) {
    menuGoBack();
    return 0;
}

