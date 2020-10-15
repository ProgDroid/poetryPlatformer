// Idle State

if (state_new) {
    state_new       = false;
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;

    if (hp <= 3) {
        sprite_index = playerIdleCalm;
        if (hp == 1) {
            sprite_index = playerIdleChill;
        }
    }
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

if (!isOnFloor() && isSlidingOff()) {
    stateSwitch("slidingOff");
}

// manually drop from platform
//if ((downPressed || downHeld) && (jumpPressed || jumpHeld) && isOnFloor()) {
//    y += 1;
//    noCollision = true;
//    stateSwitch("drop");
//}

// regular jump
if (!(downPressed || downHeld) && (jumpPressed || jumpHeld) && (isOnFloor() || isSlidingOff())) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

