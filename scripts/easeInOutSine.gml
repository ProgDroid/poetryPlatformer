/// easeInOutSine

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutSine: " + string(argument_count));
    exit;
}

return -(cos(pi * argument0) - 1) * 0.5;

