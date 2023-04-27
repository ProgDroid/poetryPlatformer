///validateUiScaling(int xScale, int yScale)

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on validateUiScaling: " + string(argument_count));
    return false;
}

return argument0 >= SETTING_UI_SCALING_MIN && argument0 <= SETTING_UI_SCALING_MAX &&
        argument1 >= SETTING_UI_SCALING_MIN && argument1 <= SETTING_UI_SCALING_MAX;

