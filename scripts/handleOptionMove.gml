/// handleOptionMove(held)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on handleOptionMove: " + string(argument_count));
    exit;
}

menuController.currentOption = incrementAndWrapMenuOption(argument0);
menuController.moveBuffer    = MENU_HOLD_DELAY;

menuController.underlineHalfLength    = 0;
menuController.underlineHalfLengthMax = menuController.menuLineLengths[menuController.currentOption];
menuController.underlineAnimTime      = 0;
menuController.underlineAnimDuration  = UNDERLINE_ANIM_DURATION;

