/// mainMenuSpinOut

menuController.menuAlpha        -= MENU_FADE_STEP;
menuController.asteriskRotation -= menuController.menuAlpha * 360 / 25;
menuController.offsetFromCentre += (1 - menuController.menuAlpha) * 1;

if (menuController.menuAlpha <= 0) {
    menuController.menuAlpha       = 1;
    menuController.menuAnimation   = menuTypingAnimation;
    menuController.menuGUI         = menuController.menuGUINext;
    menuController.menuGUIOptions  = [];

    var length = array_length_1d(menuController.nextMenuOptions);
    array_copy(menuController.menuGUIOptions, 0, menuController.nextMenuOptions, 0, array_length_1d(menuController.nextMenuOptions));
    menuController.typingArray     = [];

    for (i = 0; i < length; ++i) {
        menuController.typingArray[i] = "";
    }
}

