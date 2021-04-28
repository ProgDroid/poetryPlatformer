///facingDir

facingDir = inputController.playerRightHeld - inputController.playerLeftHeld;

if (facingDir != 0) {
    lastDir = facingDir;
}

