// Idle State

if (state_new) {
    state_new       = false;
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;
    doubleJumps     = maxDoubleJumps;

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

// manually drop from platform
//if ((downPressed || downHeld) && (jumpPressed || jumpHeld) && isOnFloor()) {
//    y += 1;
//    noCollision = true;
//    stateSwitch("drop");
//}

// regular jump
if (!(downPressed || downHeld) && (jumpPressed || jumpBuffer > 0) && (isOnFloor() || isSlidingOff())) {
    if (jumpBuffer > 0) {
        show_debug_message("jumpBuffer: " + string(jumpBuffer));
    }
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

