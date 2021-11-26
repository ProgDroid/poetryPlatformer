/// easeInOutCubic

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutCubic: " + string(argument_count));
    exit;
}

return ((argument0 < 0.5) * 4 * power(argument0, 3)) +
        (argument0 >= 0.5) * (1 - power(-2 * argument0 + 2, 3) * 0.5);

