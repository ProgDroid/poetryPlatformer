/// menuPauseMenu()

eventRegister(allEvents.fadeout, menuController.id, setMenuFlashSpeed);
eventRegister(allEvents.theend, menuController.id, endGame);
eventRegister(allEvents.fadefromwhite, menuController.id, scriptStartGame);

inputController.startAction = emptyScript;

postProcessingController.blur = false;
application_surface_draw_enable(true);

transitionOut(TRANSITION_HANDLE_OUT, transitionDirection.down, MENU_HANDLE_MAIN);

