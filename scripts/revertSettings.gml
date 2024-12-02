///revertSettings()

var mapSize = ds_map_size(settingsController.changedSettings);

if (mapSize == 0) {
    exit;
}

var key = ds_map_find_first(settingsController.changedSettings);

for (var i = 0; i < mapSize; ++i) {
    if (is_undefined(key)) {
        break;
    }

    var changedSetting = settingsController.changedSettings[? key];
    var settingType = changedSetting[CHANGED_SETTING_INDEX_TYPE];
    var handle      = changedSetting[CHANGED_SETTING_INDEX_HANDLE];
    var value       = changedSetting[CHANGED_SETTING_INDEX_ORIGINAL_VALUE];

    if (settingType == "keybinds") {
        var settingsMap = getSettingsMap(settingType);

        if (settingsMap == noone) {
            addConsoleMessage("warning", "Tried to use unknown settings type to revertSettings");
            exit;
        }

        settingsMap[? handle] = value;
        continue;
    }

    saveSetting(handle, value, false);
}

ds_map_clear(settingsController.changedSettings);

