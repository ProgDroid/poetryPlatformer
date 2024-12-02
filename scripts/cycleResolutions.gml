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

// TODO fix cancelling confirmation when exiting game from pause menu
// TODO add confirmation when going from pause to main menu
// TODO add settings menu to pause menu
// TODO make menus work for different resolutions
// TODO check why controller doesn't work anymore
//   it works when I export but it works really weird and it breaks the menus
// TODO is it worth animating "press key to set" prompt?
// TODO add gameplay options
//   dash mode toggle/hold
// TODO workout issues with changing to windowed then fullscreen
// TODO check if I have to manually set resolution to display resolution when enabling fullscreen
