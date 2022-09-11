///@description Unpause the game

timeFactorController.pauseFactor = 1;

postProcessingController.blur = false;
application_surface_draw_enable(true);

menuController.menuOn = false;

inputController.inputProcess = ingameInput;
inputController.startAction  = pause;

refreshImageSpeeds();

eventFire(allEvents.unpaused);

transitionOut(TRANSITION_HANDLE_BACK_OUT, transitionDirection.up, MENU_HANDLE_PLAY);

