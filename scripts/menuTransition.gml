/// menuTransition(menuAnimation, menuGUINext, nextInputProcess, currentOption)

if (argument_count < 4) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.menuAnimation     = argument0;
menuController.menuGUINext       = argument1;
inputController.nextInputProcess = argument2;
menuController.nextOption        = argument3;

inputController.inputProcess     = emptyScript;

