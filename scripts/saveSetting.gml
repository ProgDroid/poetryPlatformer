/// saveSetting(string handle, value, bool backup)

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on saveSetting: " + string(argument_count));
    exit;
}

var settingHandle = argument0;
var value         = argument1;

if (settingHandle == MENU_SETTING_HANDLE_FRAMERATE && validateFramerate(value)) {
    if (argument2 == true) {
        backupSetting("visual", MENU_SETTING_HANDLE_FRAMERATE, "framerate");
    }

    settingsController.visualSettings[? "framerate"] = value;
    room_speed = value;
    exit;
}

if (settingHandle == MENU_SETTING_HANDLE_RESOLUTION) {
    if (argument2 == true) {
        backupSetting("visual", MENU_SETTING_HANDLE_RESOLUTION, "resolution");
    }

    var xPosition = string_pos("x", value);

    var resX = real(string_copy(value, 1, xPosition - 1));
    var resY = real(string_copy(value, xPosition + 1, string_length(value) - xPosition));

    changeResolution(resX, resY);
    exit;
}

if (settingHandle == MENU_SETTING_HANDLE_UI_SCALING) {
    if (argument2 == true) {
        backupSetting("visual", MENU_SETTING_HANDLE_UI_SCALING, "guiScaling");
    }

    var uiScalingX = value[0];
    var uiScalingY = value[1];

    setUiScaling(uiScalingX, uiScalingY);
    exit;
}

if (settingHandle == MENU_SETTING_HANDLE_DISPLAY_MODE) {
    if (argument2 == true) {
        backupSetting("visual", MENU_SETTING_HANDLE_DISPLAY_MODE, "displayMode");
    }

    var displayModeValue = stringToDisplayMode(value);

    settingsController.visualSettings[? "displayMode"] = displayModeValue;

    var isFullscreen = displayModeValue == displayMode.fullscreen;

    window_set_fullscreen(isFullscreen);

    if (isFullscreen) {
        disableSetting(MENU_SETTING_HANDLE_RESOLUTION);
    } else {
        enableSetting(MENU_SETTING_HANDLE_RESOLUTION);
    }

    exit;
}

addConsoleMessage("warning", "Tried to save unknown setting: " + string(settingHandle));

