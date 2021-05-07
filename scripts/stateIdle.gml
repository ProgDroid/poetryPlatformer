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

    panOutAlarmIndex     = createAlarm(viewController, TICK_RATE * 5, setPanOut);
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

    viewController.offsetVertically = false;

    doubleJump = emptyScript;
}

animations();

// walk if not against wall
if (((inputController.playerLeftHeld ^^ inputController.playerRightHeld) && !isAgainstWall(inputController.playerRightHeld - inputController.playerLeftHeld))
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
    inputController.playerDownPressed = false;
    inputController.playerJumpPressed = false;
    verticalSpeed = -maxVerticalSpeed;
    doubleJump    = emptyScript;
    stateSwitch("drop");
}

