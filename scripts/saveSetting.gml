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

if (argument0 == MENU_SETTING_HANDLE_RESOLUTION) {
    var xPosition = string_pos("x", value);

    var resX = real(string_copy(value, 1, xPosition - 1));
    var resY = real(string_copy(value, xPosition + 1, string_length(value) - xPosition));

    if (validateResolution(resX, resY)) {
        changeResolution(resX, resY);
    }

}

addConsoleMessage("warning", "Tried to save unknown settings");

