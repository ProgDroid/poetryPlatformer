/// easeInCubic

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInCubic: " + string(argument_count));
    exit;
}

return power(argument0, 3);

