/// validateResolution(int resX, int resY)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on validateResolution: " + string(argument_count));
    return false;
}

return argument0 <= display_get_width() && argument1 <= display_get_height();

