///horizontalMovement(float acceleration)

if (image_speed != 0) {
    image_xscale = facingDir * PLAYERSCALE;
}

var maxSpeed = maxHorizontalSpeed - (exp((maxHp - hp) / maxHp) - 1) * 0.5;

// accelerate
if (-maxSpeed < horizontalSpeed < maxSpeed) {
    horizontalSpeed += (facingDir) * argument[0] * timeFactorController.timeFactor;
    horizontalSpeed = clamp(horizontalSpeed, -maxSpeed, maxSpeed);
}

