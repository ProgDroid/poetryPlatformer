/// menuFadeIn

menuController.menuAlpha += MENU_FADE_STEP;

if (menuController.menuAlpha >= 1) {
    menuController.menuAlpha     = 1;
    menuController.menuAnimation = menuController.menuAnimationNext;
    inputController.inputProcess = inputController.nextInputProcess;
}
