// Idle State

if (state_new) {
    state_new       = false;
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;
    doubleJumps     = maxDoubleJumps;
    noCoyote        = false;
    dashes          = maxDashes;

    if (hp <= 3) {
        sprite_index = playerIdleCalm;
        if (hp == 1) {
            sprite_index = playerIdleChill;
        }
    }

    alarm[2] = room_speed * 5;
    alarm[3] = -1;
    viewController.offsetVertically = false;
    viewController.zoomIn           = false;
    flashController.dashDark        = false;
}

animations();

// walk if not against wall
if (((leftHeld ^^ rightHeld) && !isAgainstWall(rightHeld - leftHeld))
) {
    stateSwitch("walk");
}

// platform ran away from under you
if (!isOnFloor() && !isSlidingOff()) {
    stateSwitch("drop");
}

// regular jump
if (!(downPressed || downHeld) && (jumpPressed || jumpBuffer > 0) && (isOnFloor() || isSlidingOff())) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

