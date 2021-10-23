/// moveMenuCursor

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

show_debug_message("held: ");
show_debug_message(string(held));
show_debug_message("buffer: ");
show_debug_message(string(moveBuffer));
show_debug_message("right pressed: ");
show_debug_message(string(inputController.menuRightPressed));

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

