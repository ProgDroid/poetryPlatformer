///@description Toggle dev console

devModeController.devConsole = !devModeController.devConsole;

if (devModeController.devConsole) {
    postProcessingController.blur = true;

    timeFactorController.previousTimeFactor = timeFactorController.timeFactor;
    applyTimeFactor(0);
    
    keyboard_lastchar = "";
    
    devModeController.cursor = "_";
    devModeController.alarm[0] = room_speed * 0.5 * customDeltaTimeNoTimeFactor;

    exit;
}

postProcessingController.blur = false;
application_surface_draw_enable(true);

applyTimeFactor(timeFactorController.previousTimeFactor);

