///walk

// if holding directional key
if (inputController.playerLeftHeld ^^ inputController.playerRightHeld && !isAgainstWall(inputController.playerRightHeld - inputController.playerLeftHeld)) {
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
} else if (isAgainstWall(inputController.playerRightHeld - inputController.playerLeftHeld)) {
    // push
    show_debug_message("pushing");
}

