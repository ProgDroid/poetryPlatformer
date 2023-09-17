/// scriptStartGame()

eventUnregister(allEvents.fadeout, menuController.id);
eventUnregister(allEvents.theend, menuController.id);

menuController.menuOn       = false;
inputController.startAction = pause;

room_goto_next();

