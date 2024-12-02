///backupSetting(string settingType, string uiHandle, string internalHandle)

if (argument_count != 3) {
    addConsoleMessage("warning", "Bad argument count on backupSetting: " + string(argument_count));
    exit;
}

var settingType = argument0;
var uiHandle      = argument1;
var internalHandle = argument2;
var settingHash = getChangedSettingHash(settingType, uiHandle)

var settingsMap = getSettingsMap(settingType);

if (settingsMap == noone) {
    addConsoleMessage("warning", "Passed in unknown settings type to backupSetting");
    exit;
}

if (!is_undefined(settingsController.changedSettings[? settingHash])) {
    exit;
}

var changedSetting;
var value;

if (internalHandle == "resolution") {
    value = string(settingsMap[? "width"]) + "x" + string(settingsMap[? "height"]);
} else if (internalHandle == "guiScaling") {
    value[1] = settingsMap[? "guiScalingY"];
    value[0] = settingsMap[? "guiScalingX"];
} else {
    value = settingsMap[? internalHandle];
}

changedSetting[CHANGED_SETTING_INDEX_ORIGINAL_VALUE] = value;
changedSetting[CHANGED_SETTING_INDEX_HANDLE]         = uiHandle;
changedSetting[CHANGED_SETTING_INDEX_TYPE]           = settingType;

ds_map_add(settingsController.changedSettings, settingHash, changedSetting);

