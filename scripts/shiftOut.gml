/// shiftOut()

menuController.menuListAnimTime  = 0;
menuController.menuListXGoal     = ((display_get_gui_width() * 0.5) - (display_get_gui_width() * SUB_MENU_OFFSET)) * -1;
menuController.previousMenuAlpha = 1;
var underlineHalfLength          = menuController.underlineHalfLength;
var underlineAnimTime            = menuController.underlineAnimTime;

menuTransition(menuShiftOut);

menuController.underlineHalfLength = underlineHalfLength;
menuController.underlineAnimTime   = underlineAnimTime;

