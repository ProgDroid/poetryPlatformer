/// menuFadeOut

menuController.menuAlpha -= MENU_FADE_STEP;

if (menuController.menuAlpha <= 0) {
    menuController.menuAlpha     = 0;
    menuController.menuAnimation = menuFadeIn;
    menuController.menuGUI       = menuController.menuGUINext;
}

