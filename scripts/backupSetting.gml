///backupSetting(string settingType, string handle)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on backupSetting: " + string(argument_count));
    exit;
}

var settingType = argument0;
var handle      = argument1;
var settingHash = getChangedSettingHash(settingType, handle)

var settingsMap = getSettingsMap(settingType);

if (settingsMap == noone) {
    addConsoleMessage("warning", "Passed in unknown settings type to backupSetting");
    exit;
}

if (!is_undefined(settingsMap[? settingHash])) {
    exit;
}

var changedSetting;
changedSetting[CHANGED_SETTING_INDEX_ORIGINAL_VALUE] = settingsMap[? handle];
changedSetting[CHANGED_SETTING_INDEX_HANDLE]         = handle;
changedSetting[CHANGED_SETTING_INDEX_TYPE]           = settingType;

ds_map_add(settingsController.changedSettings, settingHash, changedSetting);

