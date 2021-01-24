image_alpha -= 0.01 * timeFactorController.timeFactor;

if (image_alpha < 0) {
    stateSwitch("dead");
}

