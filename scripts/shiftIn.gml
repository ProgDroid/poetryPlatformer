/// shiftIn

menuController.menuListAnimTime  = 0;
menuController.menuListXOffset   = ((display_get_gui_width() * 0.5) - (display_get_gui_width() * SUB_MENU_OFFSET)) * -1;
menuController.menuListXGoal     = MENU_LIST_X_OFFSET;
menuController.menuAlpha         = MENU_FADED_ALPHA;

menuTransition(menuShiftIn);

menuController.underlineHalfLength = menuController.underlineHalfLengthMax;
menuController.underlineAnimTime   = menuController.underlineAnimDuration;

