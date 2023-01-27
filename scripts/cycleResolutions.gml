/// cycleResolutions()

var held = inputController.menuLeftHeld + inputController.menuRightHeld;

if (held == 0) {
    exit;
}

if (menuController.moveBuffer > 0 && !(inputController.menuLeftPressed ^^ inputController.menuRightPressed)) {
    menuController.moveBuffer -= 1;
    exit;
}

var currentResolutionIndex = ds_list_find_index(menuController.resolutions[? "resolutions"], menuController.subMenuInput);
var newResolutionIndex     = min(currentResolutionIndex + held, ds_list_size(menuController.resolutions[? "resolutions"]) - 1);
newResolutionIndex         = max(newResolutionIndex, 0);

var newResolution = ds_list_find_value(menuController.resolutions[? "resolutions"], newResolutionIndex);

menuController.subMenuInput = newResolution;
menuController.moveBuffer   = MENU_HOLD_DELAY;

menuController.subMenuArrowLeft  = hasLowerResolution(newResolution);
menuController.subMenuArrowRight = hasHigherResolution(newResolution);
