/// getControlsHandleFromOption(string option, int index)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on getControlsHandleFromOption: " + string(argument_count));
    return "";
}

var keys = settingsController.keybinds[? argument0];
var key  = keys[| argument1];

if (key == noone) {
    return "None";
}

return keyToString(key);

