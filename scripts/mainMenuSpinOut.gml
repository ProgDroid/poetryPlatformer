/// mainMenuSpinOut

menuController.menuAlpha        -= MENU_FADE_STEP;
menuController.asteriskRotation -= menuController.menuAlpha * 360 / 25;
menuController.offsetFromCentre += (1 - menuController.menuAlpha) * 1;

if (menuController.menuAlpha <= 0) {
    menuController.menuAlpha = 1;

    newMenu(menuController.nextMenu);
}
