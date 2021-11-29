/// moveMenuAsterisk

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

menuController.asteriskRotationGoal += held * 60;
menuController.asteriskRotationGoal = menuController.asteriskRotationGoal % 360;

if (menuController.asteriskRotationGoal = 0) {
    menuController.asteriskRotation = -1 * held * 60;
}

handleOptionMove(held);

