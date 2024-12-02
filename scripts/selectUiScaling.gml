///selectUiScaling()

if (inputController.menuAccept) {
    var scalingValues;
    scalingValues[1] = menuController.uiScalingY;
    scalingValues[0] = menuController.uiScalingX;

    saveSetting(MENU_SETTING_HANDLE_UI_SCALING, scalingValues, true);

    quitSubMenu();

    return 0;
}

if (inputController.menuBack) {
    quitSubMenu();

    return 0;
}

