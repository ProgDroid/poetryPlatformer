/// menuShiftOut()

var animating = menuController.menuListAnimTime < menuController.menuListAnimDuration;

menuController.menuListAnimTime += 1 * animating;

var t         = menuController.menuListAnimTime / menuController.menuListAnimDuration;
var lerpValue = script_execute(easeInOutCubic, t);

menuController.menuListXOffset = lerp(0, menuController.menuListXGoal, lerpValue);

menuController.underlineAnimTime += 1 * (menuController.underlineAnimTime < menuController.underlineAnimDuration);

var tLine         = menuController.underlineAnimTime / menuController.underlineAnimDuration;
var lerpValueLine = max(script_execute(menuController.underlineAnimation, tLine), lerpValue);

menuController.underlineHalfLength = lerp(0, menuController.underlineHalfLengthMax, lerpValueLine);

menuController.menuAlpha = lerp(1, MENU_FADED_ALPHA, t);

if (!animating) {
    menuController.previousMenuAlpha   = menuController.menuAlpha;
    menuController.menuAlpha           = 1;
    menuController.underlineHalfLength = 0;
    menuController.underlineAnimTime   = 0;
    newMenu(menuController.nextMenu);
}

