/// moveMenuHorizontalList()

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

handleOptionMove(held);

