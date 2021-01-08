///checkPressed(ds_list binds, string operator = "")
///@return boolean
// Takes list from keybinds map and checks if it was pressed
// Uses inputController.currentInputType to determine which values to use
// Operator can be "less" or "greater" since xml was having issues with "<" and ">"
//   when editing from VSCode

if (argument_count < 1 || argument_count > 2) {
    addConsoleMessage("warning", "Bad argument count on checkPressed: " + string(argument_count));
    exit;
}

if (!ds_exists(argument0, ds_type_list)) {
    addConsoleMessage("warning", "argument0 in checkPressed is not a list");
    exit;
}

if (argument_count == 1) {
    argument1 = "";
}

var keyPressed = false;

if (inputController.currentInputType == inputmethod.keyboard) {
    keyPressed = keyboard_check_pressed(argument0[| 0]) || keyboard_check_pressed(argument0[| 1]);
} else if (inputController.currentInputType == inputmethod.pad) {
    // bit dodgy but allows less code repetition
    for (var i = 2; i <= 3; i++) {
        if (argument0[| i] < gp_axislh) {
            keyPressed = keyPressed || gamepad_button_check_pressed(inputController.activePad, argument0[| i]);
        } else {
            // how I miss ternary
            if (argument1 == "greater") {
                keyPressed = keyPressed || gamepad_axis_value(inputController.activePad, argument0[| i]) > 0;
            } else {
                keyPressed = keyPressed || gamepad_axis_value(inputController.activePad, argument0[| i]) < 0;
            }
        }
    }
}

return keyPressed;

