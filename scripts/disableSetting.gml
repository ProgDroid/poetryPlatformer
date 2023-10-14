/// disableSetting(string settingHandle)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on disableSetting: " + string(argument_count));
    return 0;
}

var arraySize = array_length_1d(menuController.menuDisabledEntries);

for (var j = 0; j < arraySize; ++j) {
    if (argument0 == menuController.menuDisabledEntries[j]) {
        return 0;
    }
}

menuController.menuDisabledEntries[arraySize] = argument0;
return 0;

