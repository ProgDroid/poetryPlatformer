if (state_new) {
    state_new = false;
    createAlarm(id, TICK_RATE * 3, setStateSuckedIn);
}

if (image_index > endFrame) {
    image_index = startFrame;
}

if (image_xscale < 1) {
    image_xscale += 0.07 * timeFactorController.timeFactor * timeFactorController.pauseFactor * (1 / (zoomFactor));
}

if (image_yscale < 1) {
    image_yscale += 0.07 * timeFactorController.timeFactor * timeFactorController.pauseFactor * (1 / (zoomFactor));
}

