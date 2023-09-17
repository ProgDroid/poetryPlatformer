/// easeInOutQuad

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutQuad: " + string(argument_count));
    exit;
}

return ((argument0 < 0.5) * 2 * argument0 * argument0) +
        (argument0 >= 0.5) * (1 - (-2 * argument0 + 2) * (-2 * argument0 + 2) * 0.5);

