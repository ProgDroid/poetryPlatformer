/// menuResolution()

menuController.subMenuSelected  = menuController.currentOption;
menuController.menuMove         = moveSubMenuOptionLeftRight;
menuController.menuCursorAction = selectSubMenuOptionValue;
menuController.subMenuInputMove = cycleResolutions;

var currentOptions    = getMenuOptions();
var currentResolution = getGraphicsOptionValue(currentOptions[| menuController.currentOption]);

menuController.subMenuInput = currentResolution;

menuController.subMenuArrowLeft  = hasLowerResolution(currentResolution);
menuController.subMenuArrowRight = hasHigherResolution(currentResolution);
