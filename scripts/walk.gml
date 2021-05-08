///walk

// if holding directional key
if (inputController.playerLeftHeld != 0 ^^ inputController.playerRightHeld != 0 && !isAgainstWall(sign(inputController.playerLeftHeld) + sign(inputController.playerRightHeld))) {
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
} else if (isAgainstWall(sign(inputController.playerLeftHeld) + sign(inputController.playerRightHeld))) {
    // push
    show_debug_message("pushing");
}

