///horizontalMovement(float acceleration)

if (leftHeld && rightHeld) {
    stateSwitch("idle");
    exit;
}

image_xscale = facingDir;

// accelerate
if (-maxHorizontalSpeed < horizontalSpeed < maxHorizontalSpeed) {
    horizontalSpeed += (facingDir) * argument[0] * customDeltaTime;
    horizontalSpeed = clamp(horizontalSpeed, -maxHorizontalSpeed, maxHorizontalSpeed);
}

