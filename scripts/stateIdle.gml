// Idle State

if (state_new) {
    state_new       = false;
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;
    dashes          = maxDashes;

    if (hp <= 3) {
        sprite_index = playerIdleCalm;
        if (hp == 1) {
            sprite_index = playerIdleChill;
        }
    }

    panOutAlarmIndex     = createAlarm(viewController, TICK_RATE * 5, setPanOut, false);
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

    viewController.offsetVertically = false;

    doubleJump = emptyScript;
}

animations();

// walk if not against wall
if (((inputController.playerLeftHeld != 0 ^^ inputController.playerRightHeld != 0) && !isAgainstWall(sign(inputController.playerLeftHeld) + sign(inputController.playerRightHeld)))
) {
    stateSwitch("walk");
}

script_execute(dash);

// platform ran away from under you
if (!isOnFloor() && !isSlidingOff()) {
    doubleJump = emptyScript;
    stateSwitch("drop");
}

// regular jump
if (
      dash != inDash &&
     (inputController.playerJumpPressed || jumpBuffer > 0) &&
     (isOnFloor() || isSlidingOff())
) {
    inputController.playerJumpPressed = false;
    verticalSpeed = -maxVerticalSpeed;
    doubleJump    = emptyScript;
    stateSwitch("drop");
}

