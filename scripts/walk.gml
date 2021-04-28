///walk

// if holding directional key
if (leftHeld ^^ rightHeld && !isAgainstWall(rightHeld - leftHeld)) {
    // check for slide
    var accelerationTmp = acceleration;

    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= slideFactor;
    }

    horizontalMovement(accelerationTmp);
} else if (!isAgainstWall(sign(horizontalSpeed))){ // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * deceleration * timeFactorController.timeFactor * timeFactorController.pauseFactor;

    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
} else if (isAgainstWall(rightHeld - leftHeld)) {
    // push
    show_debug_message("pushing");
}

