///@description Pause the game

timeFactorController.pauseFactor = 0;

postProcessingController.blur = true;

menuController.menuOn = true;

inputController.inputProcess = menuInput;

refreshImageSpeeds();

transitionOut(TRANSITION_HANDLE_OUT, transitionDirection.down, MENU_HANDLE_PAUSE);

