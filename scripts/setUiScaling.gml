///setUiScaling(int xScale, int yScale)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on setUiScaling: " + string(argument_count));
    exit;
}

if (!is_real(argument0) || !is_real(argument1)) {
    addConsoleMessage("warning", "Bad argument type on setUiScaling. Expected <int, int>, got <" + string(typeof(argument0)) + "," + string(typeof(argument1)) + ">");
    exit;
}

if (!validateUiScaling(argument0, argument1)) {
    addConsoleMessage("warning", "Tried setting invalid resolution");
    exit;
}

settingsController.visualSettings[? "guiScalingX"] = argument0;
settingsController.visualSettings[? "guiScalingY"] = argument1;

// TODO check if this is just easier?
// display_set_gui_size(argument0, argument1);

if (instance_exists(GUIController)) {
    GUIController.alarm[0] = 1;
}

