///getLastPressed()

if (inputController.currentInputType == inputmethod.pad) {
    var slot = inputController.activePad;

    if (gamepad_axis_value(slot, gp_axislh) != 0) {
        return gp_axislh;
    }

    if (gamepad_axis_value(slot, gp_axislv) != 0) {
        return gp_axislv;
    }

    if (gamepad_axis_value(slot, gp_axisrh) != 0) {
        return gp_axisrh;
    }

    if (gamepad_axis_value(slot, gp_axisrv) != 0) {
        return gp_axisrv;
    }

    for (var j = gp_face1; j < gp_axislv; j++) {
        if (gamepad_button_check_pressed(slot, j)) {
            return j;
        }
    }
    
    return noone;
} else if (
    inputController.currentInputType == inputmethod.keyboard &&
    (
        mouse_check_button_pressed(mb_any) ||
        keyboard_check_pressed(vk_anykey)
    )
) {
    return keyboard_lastkey;
}

