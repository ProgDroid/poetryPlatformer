///handleSubMenuUnderlineAnimation()

menuController.subMenuUnderlineAnimTime += 1 * (menuController.subMenuUnderlineAnimTime < menuController.subMenuUnderlineAnimDuration);

var t         = menuController.subMenuUnderlineAnimTime / menuController.subMenuUnderlineAnimDuration;
var lerpValue = script_execute(menuController.subMenuUnderlineAnimation, t);

menuController.subMenuUnderlineHalfLength = lerp(0, menuController.subMenuUnderlineHalfLengthMax, lerpValue);

menuController.subMenuValueUnderlineAnimTime += 1 * (menuController.subMenuValueUnderlineAnimTime < menuController.subMenuValueUnderlineAnimDuration);

t         = menuController.subMenuValueUnderlineAnimTime / menuController.subMenuValueUnderlineAnimDuration;
lerpValue = script_execute(menuController.subMenuValueUnderlineAnimation, t);

menuController.subMenuValueUnderlineHalfLength = lerp(0, menuController.subMenuValueUnderlineHalfLengthMax, lerpValue);

