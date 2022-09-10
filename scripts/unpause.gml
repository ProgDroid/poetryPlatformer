///@description Unpause the game

timeFactorController.pauseFactor = 1;

postProcessingController.blur = false;
application_surface_draw_enable(true);

menuController.menuOn = false;

inputController.inputProcess = ingameInput;
inputController.startAction  = pause;

refreshImageSpeeds();

transitionOut(TRANSITION_HANDLE_BACK_OUT, transitionDirection.up, MENU_HANDLE_PLAY);

