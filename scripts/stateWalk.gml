///stateWalk

if (state_new) {
    state_new    = false;
    sprite_index = playerWalk;
    image_index  = 0;
    dashes       = maxDashes;

    if (hp <= 3) {
        sprite_index = playerWalkCalm;
        if (hp == 1) {
            sprite_index = playerWalkChill;
        }
    }

    panOutAlarmIndex     = cancelAlarm(panOutAlarmIndex, setPanOut);
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

    viewController.panOut           = false;
    viewController.offsetVertically = false;

    moveHorizontal = walk;
    doubleJump     = emptyScript;
}

animations();

script_execute(facingDirection);

script_execute(collectStuff);

script_execute(moveHorizontal);

// collisions
horizontalCollisions();

// if stopped, idle
if (horizontalSpeed == 0) {
    stateSwitch("idle");
}

script_execute(dash);

// no floor
if (!isOnFloor() && !isSlidingOff()) {
    doubleJump = coyoteJump;
    stateSwitch("drop");
}

// jump
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

