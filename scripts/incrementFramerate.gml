/// incrementFramerate()

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

var newFramerate = min(menuController.subMenuInput + held, SETTING_FRAMERATE_MAX);
newFramerate     = max(newFramerate, SETTING_FRAMERATE_MIN);

menuController.subMenuInput = newFramerate;
menuController.moveBuffer   = MENU_HOLD_DELAY;

menuController.subMenuArrowLeft  = framerateAboveMin(newFramerate);
menuController.subMenuArrowRight = framerateBelowMax(newFramerate);
