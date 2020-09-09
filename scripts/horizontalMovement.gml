///horizontalMovement(float acceleration)

if (leftHeld && rightHeld) {
    stateSwitch("idle");
    exit;
}

image_xscale = facingDir;

var maxSpeed = maxHorizontalSpeed - (exp((maxHp - hp) / maxHp) - 1);

// accelerate
if (-maxSpeed < horizontalSpeed < maxSpeed) {
    horizontalSpeed += (facingDir) * argument[0] * customDeltaTime;
    horizontalSpeed = clamp(horizontalSpeed, -maxSpeed, maxSpeed);
}

