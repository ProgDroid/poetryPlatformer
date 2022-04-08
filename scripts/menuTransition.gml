/// menuTransition(menuAnimation)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.menuAnimation          = argument0;
menuController.menuCursorAction       = emptyScript;
menuController.menuMove               = emptyScript;
menuController.moveBuffer             = 0;
menuController.underlineAnimTime      = 0;
menuController.underlineAnimDuration  = UNDERLINE_ANIM_DURATION; // ? needed?
menuController.underlineHalfLength    = 0;

