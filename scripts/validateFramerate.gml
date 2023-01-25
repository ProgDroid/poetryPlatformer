/// validateFramerate(int framerate)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on validateFramerate: " + string(argument_count));
    return false;
}

return argument0 >= SETTING_FRAMERATE_MIN && argument0 <= SETTING_FRAMERATE_MAX;

