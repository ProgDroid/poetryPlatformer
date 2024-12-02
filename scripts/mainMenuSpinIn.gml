/// mainMenuSpinIn

menuController.menuAlpha           += MENU_FADE_STEP;
menuController.asteriskRotation    += menuController.menuAlpha * 360 / 25;
menuController.offsetFromCentre    -= (1 - menuController.menuAlpha) * 1;
menuController.underlineAnimTime    = 0;
menuController.underlineHalfLength  = 0;

if (menuController.menuAlpha >= 1) {
    menuController.offsetFromCentre = 1;
    menuController.menuAlpha = 1;
    transitionInEnd();
}

