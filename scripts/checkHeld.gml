///checkHeld(ds_list binds)
///@return boolean
// Takes list from keybinds map and checks if currently being held
// Uses inputController.currentInputType to determine which values to use

if (argument_count != 1) {
    addConsoleMessage("warning", "Bad argument count on checkHeld: " + string(argument_count));
    exit;
}

if (!ds_exists(argument0, ds_type_list)) {
    addConsoleMessage("warning", "argument0 in checkHeld is not a list");
    exit;
}

if (inputController.currentInputType == inputmethod.keyboard) {
    return keyboard_check(argument0[| 0]) || keyboard_check(argument0[| 1]);
} else if (inputController.currentInputType == inputmethod.pad) {
    var toReturn = false;

    for (var i = 2; i < 4; ++i) {
        if (argument0[| i] != noone && argument0[| i] < gp_axislh) {
            toReturn = toReturn || gamepad_button_check(inputController.activePad, argument0[| i]);
        }
    }

    return toReturn;
}

return false;

