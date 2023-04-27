/// handleKeybindMove(held)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on handleKeybindMove: " + string(argument_count));
    exit;
}

if (argument0 == 0) {
    exit;
}

menuController.currentBind = incrementAndWrapMenuBind(argument0);
menuController.moveBuffer  = MENU_HOLD_DELAY;

menuController.subMenuValueUnderlineHalfLength    = 0;
menuController.subMenuValueUnderlineAnimTime      = 0;
