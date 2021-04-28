///drop

var gravTmp = grav;

if (inputController.playerJumpHeld && abs(verticalSpeed) < 1) {
    gravTmp /= 2;
}

verticalSpeed += gravTmp * timeFactorController.timeFactor;
verticalSpeed  = clamp(verticalSpeed, -maxVerticalSpeed, maxVerticalSpeed);

