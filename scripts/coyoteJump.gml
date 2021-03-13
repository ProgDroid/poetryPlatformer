///coyoteJump

if (
    verticalSpeed >= 0 &&
    horizontalSpeed != 0
) {
    y -= state_timer div 2;

    verticalSpeed = -maxVerticalSpeed;
    doubleJump    = emptyScript;
    stateSwitch("drop");
}

