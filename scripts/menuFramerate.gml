/// menuFramerate()

menuController.subMenuSelected  = menuController.currentOption;
menuController.menuMove         = moveSubMenuOptionLeftRight;
menuController.menuCursorAction = selectSubMenuOptionValue;
menuController.subMenuInputMove = incrementFramerate;

var currentOptions   = getMenuOptions();
var currentFramerate = real(getGraphicsOptionValue(currentOptions[| menuController.currentOption]));

menuController.subMenuInput = currentFramerate;

menuController.subMenuArrowLeft  = framerateAboveMin(currentFramerate);
menuController.subMenuArrowRight = framerateBelowMax(currentFramerate);

