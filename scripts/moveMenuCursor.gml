/// moveMenuCursor

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

var option = menuController.currentOption;

option += held;
option = option % MENU_OPTION_COUNT + (MENU_OPTION_COUNT * (option < 0));

menuController.currentOption = option;

menuController.moveBuffer = MENU_HOLD_DELAY;

menuController.asteriskRotationGoal += held * 60;
menuController.asteriskRotationGoal = menuController.asteriskRotationGoal % 360;

if (menuController.asteriskRotationGoal = 0) {
    menuController.asteriskRotation = -1 * held * 60;
}

menuController.underlineHalfLength    = 0;
menuController.underlineHalfLengthMax = menuController.menuLineLengths[currentOption];
menuController.underlineAnimTime      = 0;
menuController.underlineAnimDuration  = UNDERLINE_ANIM_DURATION;

