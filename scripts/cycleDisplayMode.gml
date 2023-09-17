/// cycleDisplayMode()

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

var currentDisplayMode = stringToDisplayMode(menuController.subMenuInput);
var newDisplayMode     = min(currentDisplayMode + held, getHighestDisplayMode());
newDisplayMode         = max(newDisplayMode, getLowestDisplayMode());

menuController.subMenuInput = displayModeToString(newDisplayMode);
menuController.moveBuffer   = MENU_HOLD_DELAY;

menuController.subMenuArrowLeft  = hasLowerDisplayMode(newDisplayMode);
menuController.subMenuArrowRight = hasHigherDisplayMode(newDisplayMode);

