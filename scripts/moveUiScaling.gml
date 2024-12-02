///moveUiScaling()

var upDownHeld    = inputController.menuUpHeld + inputController.menuDownHeld;
var leftRightHeld = inputController.menuLeftHeld + inputController.menuRightHeld;

if (upDownHeld == 0 && leftRightHeld == 0) {
    exit;
}

if (menuController.moveBuffer > 0 &&
    !(inputController.menuUpPressed ^^ inputController.menuDownPressed) &&
    !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)
) {
    menuController.moveBuffer -= 1;
    exit;
}

var xMoveValue = MENU_UI_SCALING_STEP * leftRightHeld * -1;
var yMoveValue = MENU_UI_SCALING_STEP * upDownHeld * -1;

var uiScalingX            = min(menuController.uiScalingX + xMoveValue, SETTING_UI_SCALING_MAX);
menuController.uiScalingX = max(uiScalingX, SETTING_UI_SCALING_MIN);

var uiScalingY            = min(menuController.uiScalingY + yMoveValue, SETTING_UI_SCALING_MAX);
menuController.uiScalingY = max(uiScalingY, SETTING_UI_SCALING_MIN);

menuController.moveBuffer = MENU_UI_SCALING_HOLD_DELAY;

