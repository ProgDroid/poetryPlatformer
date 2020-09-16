///@description Toggle dev console

devModeController.devConsole = !devModeController.devConsole;

if (devModeController.devConsole) {
    postProcessingController.blur = true;

    devModeController.previousTimeFactor = global.timeFactor;
    applyTimeFactor(0);
    
    addConsoleMessage("warning", "hello");

    exit;
}

postProcessingController.blur = false;
application_surface_draw_enable(true);

applyTimeFactor(devModeController.previousTimeFactor);

