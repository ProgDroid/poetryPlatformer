/// scriptBackToMenu()

eventUnregister(allEvents.menufaded, menuController.id);

timeFactorController.pauseFactor = 1;
refreshImageSpeeds();

room_goto(MENU);

menuController.currentOption          = 0;
menuController.asteriskRotation       = 0;
menuController.asteriskRotationGoal   = 0;
menuController.asteriskSize           = ASTERISK_SIZE;

resetCamera();
