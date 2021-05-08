///@description Check axis value
///@arg <list>  List of keybinds
///@arg <bool>  Negate value
///@return int  Value between -1 and 1
// Takes list from keybinds map and checks if currently being held

if (argument_count != 2) {
    addConsoleMessage("warning", "Bad argument count on checkAxis: " + string(argument_count));
    exit;
}

if (!ds_exists(argument0, ds_type_list)) {
    addConsoleMessage("warning", "argument0 in checkAxis is not a list");
    exit;
}

if (inputController.currentInputType == inputmethod.keyboard) {
    return (keyboard_check(argument0[| 0]) || keyboard_check(argument0[| 1])) * -1 * argument1;
} else if (inputController.currentInputType == inputmethod.pad) {
    var axisValues;
    axisValues[1] = 0;
    axisValues[0] = 0;

    for (var i = 2; i < 4 && argument0[| i] != noone; ++i) {
        if (argument0[| i] >= gp_axislh) {
            axisValues[i - 2] = gamepad_axis_value(inputController.activePad, argument0[| i]);
        } else {
            axisValues[i - 2] = gamepad_button_check(inputController.activePad, argument0[| i]);
        }
    }

    if ((axisValues[0] * axisValues[1]) > 0) {
        var toReturn = axisValues[0];

        if (abs(axisValues[1]) > abs(axisValues[0])) {
            toReturn = axisValues[1];
        }

        return toReturn;
    } else if ((axisValues[0] * axisValues[1]) == 0) {
        return axisValues[0] + axisValues[1];
    }
}

return 0;

