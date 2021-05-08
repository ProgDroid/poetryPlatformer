///facingDir

facingDir = sign(inputController.playerLeftHeld) + sign(inputController.playerRightHeld);

if (facingDir != 0) {
    lastDir = facingDir;
}

