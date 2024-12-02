/// easeInOutQuint

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutQuint: " + string(argument_count));
    exit;
}

return ((argument0 < 0.5) * 16 * power(argument0, 5)) +
        (argument0 >= 0.5) * (1 - power(-2 * argument0 + 2, 5) * 0.5);

