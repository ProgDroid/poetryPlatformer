///airWalk

// air movement
if (((leftHeld ^^ rightHeld) && !isAgainstWallAir(rightHeld - leftHeld))) {
    var accelerationTmp = acceleration;

    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= airFrictionFactor;
    }

    horizontalMovement(accelerationTmp);
} else { // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * airDeceleration * timeFactorController.timeFactor;

    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
}

