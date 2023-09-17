/// smoothStep

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on smoothStep: " + string(argument_count));
    exit;
}

return argument0 * argument0 * (3 - 2 * argument0);

