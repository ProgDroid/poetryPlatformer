/// stateSlidingOff

if (state_new) {
    state_new    = false;
    sprite_index = playerIdle; // needs its own sprite
    image_index  = 0;
}

animations();

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = min(verticalSpeed, slidingOffSpeed);

verticalCollisions();

horizontalCollisions();

if (verticalSpeed == 0 && isOnFloor()) {
    if (hp <= 3) {
        alarm[1] = room_speed * 0.5 * customDeltaTime;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        if (hp == 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 1;
        }
    }

    if (horizontalSpeed != 0 || (leftHeld ^^ rightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

if (!isSlidingOff() && !isOnFloor()) {
    stateSwitch("drop");
}

if (jumpPressed) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

