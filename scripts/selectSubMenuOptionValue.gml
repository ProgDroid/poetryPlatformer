/// selectSubMenuOptionValue()

if (inputController.menuAccept && menuController.subMenuInput != noone) {
    var currentOptions = getMenuOptions();

    saveSetting(currentOptions[| menuController.subMenuSelected], menuController.subMenuInput, true);

    quitSubMenu();

    return 0;
}

if (inputController.menuBack) {
    quitSubMenu();

    return 0;
}

