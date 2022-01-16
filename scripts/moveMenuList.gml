/// moveMenuList

var held = inputController.menuUpHeld + inputController.menuDownHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuUpPressed ^^ inputController.menuDownPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

handleOptionMove(held);

