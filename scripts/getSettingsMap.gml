///getSettingsMap(string type)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on getSettingsMap: " + string(argument_count));
    return noone;
}

var settingType = argument0;

var settingsMap = noone;

if (settingType == "keybinds") {
    settingsMap = settingsController.keybinds;
} else if (settingType == "visual") {
    settingsMap = settingsController.visualSettings;
}

return settingsMap;

