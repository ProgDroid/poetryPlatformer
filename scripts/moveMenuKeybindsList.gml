///moveMenuKeybindsList()

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

handleOptionMove(upDownHeld);
handleKeybindMove(leftRightHeld);
