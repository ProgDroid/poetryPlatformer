/// menuFadeOut

menuController.menuAlpha -= MENU_FADE_STEP;

if (menuController.menuAlpha <= 0) {
    menuController.menuAlpha     = 0;

    newMenu(menuController.nextMenu);
}

