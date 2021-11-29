/// menuTransition(menuAnimation, menuAnimationNext, menuGUINext, nextMenuMove, nextOption, menuActions, menuOptionCount, menuLineLengths)

if (argument_count < 8) {
    addConsoleMessage("warning", "Bad argument count on menuTransition: " + string(argument_count));
    exit;
}

menuController.menuAnimation     = argument0;
menuController.menuAnimationNext = argument1;
menuController.menuGUINext       = argument2;
menuController.nextMenuMove      = argument3;
menuController.nextOption        = argument4;
menuController.menuActions       = argument5;
menuController.menuOptionCount   = argument6;
menuController.menuLineLengths   = argument7;

menuController.menuMove               = emptyScript;
menuController.moveBuffer             = 0;
menuController.underlineAnimTime      = 0;
menuController.underlineAnimDuration  = UNDERLINE_ANIM_DURATION;
menuController.underlineHalfLength    = 0;
menuController.underlineHalfLengthMax = menuController.menuLineLengths[menuController.nextOption];
