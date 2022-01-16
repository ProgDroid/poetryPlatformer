/// handleSubMenuAnimation()

menuController.menuListAnimTime += 1 * (menuController.menuListAnimTime < menuController.menuListAnimDuration);

var t         = menuController.menuListAnimTime / menuController.menuListAnimDuration;
var lerpValue = script_execute(easeInOutCubic, t);

menuController.menuListXOffset = lerp(0, menuController.menuListXGoal, lerpValue);

