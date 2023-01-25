/// selectSubMenuOptionValue()

if (inputController.menuAccept && menuController.subMenuInput != noone) {
    var currentOptions = getMenuOptions();

    saveSetting(currentOptions[| menuController.subMenuSelected], menuController.subMenuInput);

    menuController.subMenuInput     = noone;
    menuController.subMenuSelected  = -1;
    menuController.menuMove         = asset_get_index(getMenuMove());
    menuController.menuCursorAction = selectMenuOption;
    menuController.subMenuInputMove = emptyScript;

    return 0;
}

if (inputController.menuBack) {
    menuController.subMenuInput     = noone;
    menuController.subMenuSelected  = -1;
    menuController.menuMove         = asset_get_index(getMenuMove());
    menuController.menuCursorAction = selectMenuOption;
    menuController.subMenuInputMove = emptyScript;

    return 0;
}

