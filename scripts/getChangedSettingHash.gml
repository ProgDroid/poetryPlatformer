///getChangedSettingHash(string settingType, string handle)
///@return string

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on getChangedSettingHash: " + string(argument_count));
    return "";
}

return argument0 + "_" + argument1;

