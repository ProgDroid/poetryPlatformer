/// easeOutQuad

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeOutQuad: " + string(argument_count));
    exit;
}

return 1 - (1 - argument0) * (1 - argument0);

