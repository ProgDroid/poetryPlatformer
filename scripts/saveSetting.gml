/// saveSetting(string handle, value)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on saveSetting: " + string(argument_count));
    exit;
}

var settingHandle = argument0;
var value         = argument1;

if (settingHandle == MENU_SETTING_HANDLE_FRAMERATE && validateFramerate(value)) {
    settingsController.visualSettings[? "framerate"] = value;
    room_speed = value;
}

addConsoleMessage("warning", "Tried to save unknown settings");

