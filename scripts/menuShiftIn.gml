/// menuShiftIn()

var animating = menuController.menuListAnimTime < menuController.menuListAnimDuration;

menuController.menuListAnimTime += 1 * animating;

var t         = menuController.menuListAnimTime / menuController.menuListAnimDuration;
var lerpValue = script_execute(easeInOutCubic, t);

menuController.menuListXOffset = lerp(((display_get_gui_width() * 0.5) - (display_get_gui_width() * SUB_MENU_OFFSET)) * -1, menuController.menuListXGoal, lerpValue);

menuController.menuAlpha = lerp(MENU_FADED_ALPHA, 1, t);

if (!animating) {
    menuController.menuAlpha = 1;
    transitionInEnd();
}

