///horizontalMovement(float acceleration)

if (image_speed != 0) {
    image_xscale = facingDir * PLAYERSCALE;
}

var factor    = 0.4 + 0.6 * abs(inputController.playerLeftHeld + inputController.playerRightHeld);
var maxSpeed  = (maxHorizontalSpeed - (exp((maxHp - hp) / maxHp) - 1) * 0.5) * factor;

// accelerate
horizontalSpeed += (facingDir) * argument[0] * timeFactorController.timeFactor * timeFactorController.pauseFactor;
horizontalSpeed = clamp(horizontalSpeed, -maxSpeed, maxSpeed);

