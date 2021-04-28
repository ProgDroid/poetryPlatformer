image_alpha -= 0.01 * timeFactorController.timeFactor * timeFactorController.pauseFactor;

if (image_alpha < 0) {
    stateSwitch("dead");
}

