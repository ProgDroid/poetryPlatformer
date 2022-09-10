/// scriptBackToMenu()

eventUnregister(allEvents.menufaded, menuController.id);

timeFactorController.pauseFactor = 1;
refreshImageSpeeds();

room_goto(MENU);

