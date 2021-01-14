///changeResolution(int width, int height)
// Change resolution and set view to match it

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on changeResolution: " + string(argument_count));
    exit;
}

if (!is_real(argument0) || !is_real(argument1)) {
    addConsoleMessage("warning", "Bad argument type on changeResolution. Expected <int, int>, got <" + string(typeof(argument0)) + "," + string(typeof(argument1)) + ">");
}

settingsController.visualSettings[? "width"]  = argument0;
settingsController.visualSettings[? "height"] = argument1;

if (!window_get_fullscreen()) {
    window_set_size(argument0, argument1);
    settingsController.alarm[0] = 1; // window_center()
}

display_set_gui_maximise();

