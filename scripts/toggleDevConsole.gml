///@description Toggle dev console

devModeController.devConsole = !devModeController.devConsole;

if (devModeController.devConsole) {
    postProcessingController.blur = true;

    pause();

    keyboard_lastchar = "";
    
    devModeController.cursor   = "_";
    devModeController.alarm[0] = TICK_RATE * 0.5;

    exit;
}

postProcessingController.blur = false;
application_surface_draw_enable(true);

unpause();

