///airWalk

// air movement
if (((inputController.playerLeftHeld != 0 ^^ inputController.playerRightHeld != 0) && !isAgainstWallAir(sign(inputController.playerLeftHeld) + sign(inputController.playerRightHeld)))) {
    var accelerationTmp = acceleration;

    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= airFrictionFactor;
    }

    horizontalMovement(accelerationTmp);
} else { // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * airDeceleration * timeFactorController.timeFactor * timeFactorController.pauseFactor;

    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
}

