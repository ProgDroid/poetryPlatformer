/// handleUnderlineAnimation

menuController.underlineAnimTime += 1 * (menuController.underlineAnimTime < menuController.underlineAnimDuration);

var t         = menuController.underlineAnimTime / menuController.underlineAnimDuration;
var lerpValue = script_execute(menuController.underlineAnimation, t);

menuController.underlineHalfLength = lerp(0, menuController.underlineHalfLengthMax, lerpValue);

