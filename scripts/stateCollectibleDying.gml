image_alpha -= 0.01 * customDeltaTime;

if (image_alpha < 0) {
    stateSwitch("dead");
}

