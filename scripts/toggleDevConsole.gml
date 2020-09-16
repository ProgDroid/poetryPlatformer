///@description Toggle dev console

devConsole = !devConsole;

if (devConsole) {
    postProcessingController.blur = true;
    previousTimeFactor = global.timeFactor;
    applyTimeFactor(0);
    show_debug_message("devConsole on");
    exit;
}

postProcessingController.blur = false;
application_surface_draw_enable(true);
applyTimeFactor(previousTimeFactor);
show_debug_message("devConsole off");

