/// keyToString(key)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on keyToString: " + string(argument_count));
    return "";
}

return menuController.keyMap[? argument0];

