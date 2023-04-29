/// saveSetting(string handle, value)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on saveSetting: " + string(argument_count));
    exit;
}

var settingHandle = argument0;
var value         = argument1;

if (settingHandle == MENU_SETTING_HANDLE_FRAMERATE && validateFramerate(value)) {
    backupSetting("visual", "framerate");

    settingsController.visualSettings[? "framerate"] = value;
    room_speed = value;
}

if (settingHandle == MENU_SETTING_HANDLE_RESOLUTION) {
    backupSetting("visual", "width");
    backupSetting("visual", "height");

    var xPosition = string_pos("x", value);

    var resX = real(string_copy(value, 1, xPosition - 1));
    var resY = real(string_copy(value, xPosition + 1, string_length(value) - xPosition));

    changeResolution(resX, resY);
}

if (settingHandle == MENU_SETTING_HANDLE_UI_SCALING) {
    backupSetting("visual", "guiScalingX");
    backupSetting("visual", "guiScalingY");

    var uiScalingX = value[0];
    var uiScalingY = value[1];

    setUiScaling(uiScalingX, uiScalingY);
}

addConsoleMessage("warning", "Tried to save unknown settings");

