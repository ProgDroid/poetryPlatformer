/// framerateBelowMax(int framerate)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on framerateAboveMin: " + string(argument_count));
    return false;
}

return argument0 < SETTING_FRAMERATE_MAX;

