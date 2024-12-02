/// menuPauseMenu()

eventRegister(allEvents.fadeout, menuController.id, setMenuFlashSpeed);
eventRegister(allEvents.theend, menuController.id, endGame);
eventRegister(allEvents.fadefromwhite, menuController.id, scriptStartGame);

postProcessingController.blur = false;
application_surface_draw_enable(true);

timeFactorController.pauseFactor = 1;

transitionOut(TRANSITION_HANDLE_OUT, transitionDirection.down, MENU_HANDLE_MAIN);

