/// stringToDisplayMode(string displayMode)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on stringToDisplayMode: " + string(argument_count));
    return "";
}

if (argument0 == "windowed") {
    return displayMode.windowed;
}

if (argument0 == "fullscreen") {
    return displayMode.fullscreen;
}

return displayMode.fullscreen;

