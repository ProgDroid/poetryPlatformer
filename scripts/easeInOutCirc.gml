/// easeInOutCirc

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutCirc: " + string(argument_count));
    exit;
}

// have to if because sqrt of negative numbers is impossible

if (argument0 < 0.5) {
    return (1 - sqrt(1 - (2 * argument0) * (2 * argument0))) * 0.5;
} else {
    return (sqrt(1 - ((-2 * argument0 + 2) * (-2 * argument0 + 2))) + 1) * 0.5;
}
        
