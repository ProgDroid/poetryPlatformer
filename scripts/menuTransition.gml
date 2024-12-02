/// menuTransition(menuAnimation)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.menuAnimation          = argument0;
menuController.menuCursorAction       = emptyScript;
menuController.menuMove               = emptyScript;
menuController.moveBuffer             = 0;
menuController.subMenuInputSpeedup    = 1;

