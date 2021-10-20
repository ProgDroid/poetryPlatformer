/// moveMenuCursor
///@arg inputValue

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on moveMenuCursor: " + string(argument_count));
    exit;
}

if (argument[0] == 0) {
    exit;
}

var option = menuController.currentOption;

option += argument[0];
option = option % MENU_OPTION_COUNT + (MENU_OPTION_COUNT * (option < 0));

menuController.currentOption = option;

