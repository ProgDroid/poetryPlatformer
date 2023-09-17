/// hasHigherDisplayMode(currentDisplayMode)

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on hasLowerDisplayMode: " + string(argument_count));
    return false;
}

return argument0 < getHighestDisplayMode();

