/// selectMenuOption

if (inputController.menuAccept) {
    var menuActionList = getMenuActions();

    script_execute(asset_get_index(menuActionList[| menuController.currentOption]));
}

