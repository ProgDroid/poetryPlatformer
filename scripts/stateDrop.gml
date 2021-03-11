///stateDrop

if (state_new) {
    state_new    = false;
    sprite_index = playerJump;
    image_index  = 2;
    jumpBuffer   = 0;

    if (verticalSpeed == -maxVerticalSpeed) {
        image_index = 0;
        drawingScaleX = 0.75 - 0.05;
        drawingScaleY = 1.35 + 0.05;
        image_speed   = 0;
    }

    alarm[2] = -1;
    alarm[3] = room_speed * 1;
    viewController.panOut    = false;
    viewController.zoomIn    = false;
    flashController.dashDark = false;

    moveHorizontal = airWalk;
}

animations();

script_execute(facingDirection);

script_execute(collectStuff);

script_execute(moveVertical);

script_execute(moveHorizontal);

// collisions
verticalCollisions();

script_execute(slideAlongWalls);

horizontalCollisions();

if (jumpBuffer > 0) {
    jumpBuffer -= 1;
}

if (jumpPressed) {
    jumpBuffer = maxJumpBuffer;
}

if (
    jumpPressed &&
    state_timer <= coyoteTime &&
    verticalSpeed >= 0 &&
    horizontalSpeed != 0 &&
    !noCoyote
) {
    y -= state_timer div 2;

    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

if (jumpPressed) {
    script_execute(doubleJump);
}

if (dashPressed && dashes > 0) {
    dashTimer = 3;
}

if (dashHeld) {
    dashTimer--;
}

// dash
if (state_timer > dashTime && dashTimer == 0) {
    dashTimer = -1;
    stateSwitch("dashStart", false);
}

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
    if (hp <= 3) {
        alarm[1] = room_speed * 0.5;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp == 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        }
    }

    if (horizontalSpeed != 0 || (leftHeld ^^ rightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

if (bbox_top > (room_height + 50)) {
    eventFire(allEvents.playerfell);
}

