/// handleOptionMove(held)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on handleOptionMove: " + string(argument_count));
    exit;
}

menuController.currentOption = incrementAndWrapMenuOption(argument0);
menuController.moveBuffer    = MENU_HOLD_DELAY;

var lengths = getMenuLineLengths();

menuController.underlineHalfLength    = 0;
menuController.underlineHalfLengthMax = lengths[| menuController.currentOption];
menuController.underlineAnimTime      = 0;

// TODO are platforms persistent?? this would be bad
// TODO improve game-back-to-menu animation (level displays freaky for a frame before moving to menu)