/// menuPauseExit()

postProcessingController.blur = false;
application_surface_draw_enable(true);

inputController.inputProcess = emptyScript;
inputController.startAction  = emptyScript;

timeFactorController.pauseFactor = 1;
timeFactorController.timeFactor  = 0;

transitionOut(TRANSITION_HANDLE_BACK_OUT, transitionDirection.down, MENU_HANDLE_EXIT);

// TODO do some fading when going back to menu
// TODO reset camera when going into game