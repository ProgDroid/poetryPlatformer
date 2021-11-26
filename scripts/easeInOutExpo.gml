/// easeInOutExpo
// 0 -> 0.5 circ
// 0.5 -> 1 sine

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on easeInOutExpo: " + string(argument_count));
    exit;
}

// have to do if because sqrt of negative numbers is impossible
if (argument0 == 0) {
    return 0;
} else if (argument0 == 1) {
    return 1;
} else if (argument0 < 0.5) {
    return power(2, 20 * argument0 - 10) * 0.5;
} else {
    return (2 - power(2, -20 * argument0 + 10)) * 0.5;
}

