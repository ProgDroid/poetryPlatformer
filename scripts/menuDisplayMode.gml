/// menuDisplayMode()

menuController.subMenuSelected  = menuController.currentOption;
menuController.menuMove         = moveSubMenuOptionLeftRight;
menuController.menuCursorAction = selectSubMenuOptionValue;
menuController.subMenuInputMove = cycleDisplayMode;

var currentOptions     = getMenuOptions();
var currentDisplayMode = getGraphicsOptionValue(currentOptions[| menuController.currentOption]);

menuController.subMenuInput = currentDisplayMode;

menuController.subMenuArrowLeft  = hasLowerDisplayMode(stringToDisplayMode(currentDisplayMode));
menuController.subMenuArrowRight = hasHigherDisplayMode(stringToDisplayMode(currentDisplayMode));

