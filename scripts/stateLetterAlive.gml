if (state_new) {
    state_new = false;
    alarm[0] = room_speed * 3;
}

if (image_index > endFrame) {
    image_index = startFrame;
}

if (image_xscale < 1) {
    image_xscale += 0.07 * timeFactorController.timeFactor * (1 / (zoomFactor));
}

if (image_yscale < 1) {
    image_yscale += 0.07 * timeFactorController.timeFactor * (1 / (zoomFactor));
}

