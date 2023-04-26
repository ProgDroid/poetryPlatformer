///@description Check if devmode has been activated

if (!isRunningFromIde()) {
    exit;
}

var stringLength = string_length(keyboard_string);

if (stringLength >= 7) { // length of "devmode"
    var toCheck       = clamp(stringLength - 7, 0, 7);
    var stringToCheck = string_copy(keyboard_string, stringLength - 7 - toCheck, stringLength);

    if (string_pos("devmode", stringToCheck) != 0) {
        instance_create(32, 32, devModeController);
        exit;
    }
}

alarm[0] = TICK_RATE * 0.25;

