/// enableSetting(string settingHandle)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on enableSetting: " + string(argument_count));
    return 0;
}

var arraySize = array_length_1d(menuController.menuDisabledEntries);

for (var j = 0; j < arraySize; ++j) {
    if (argument0 == menuController.menuDisabledEntries[j]) {
        if (arraySize == 1) {
            menuController.menuDisabledEntries = array_create(0);
            return 0;
        }

        menuController.menuDisabledEntries[j] = menuController.menuDisabledEntries[arraySize - 1];
        var tmp = array_create(0);
        array_copy(tmp, 0, menuController.menuDisabledEntries, 0, arraySize - 1);
        menuController.menuDisabledEntries = array_create(0);
        array_copy(menuController.menuDisabledEntries, 0, tmp, 0, arraySize - 1);

        break;
    }
}

return 0;

