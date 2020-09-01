if (state_timer > room_speed * 3 * customDeltaTime) {
    stateSwitch("suckedIn");
}

if (image_index > endFrame) {
    image_index = startFrame;
}

if (image_xscale < 1) {
    image_xscale += 0.07 * customDeltaTime * (1 / (zoomFactor));
}

if (image_yscale < 1) {
    image_yscale += 0.07 * customDeltaTime * (1 / (zoomFactor));
}

