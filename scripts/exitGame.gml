/// exitGame()

postProcessingController.blur = false;
application_surface_draw_enable(true);

timeFactorController.pauseFactor = 1;
timeFactorController.timeFactor  = 0;

eventFire(allEvents.fadeout);
eventFire(allEvents.unpaused);

menuTransition(gameFadeOut);

