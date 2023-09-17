/// displayModeToString(displayMode)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on displayModeToString: " + string(argument_count));
    return "";
}

if (argument0 == displayMode.windowed) {
    return "windowed";
}

if (argument0 == displayMode.fullscreen) {
    return "fullscreen";
}

return "";

