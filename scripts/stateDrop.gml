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

if (state_timer == COYOTE_TIME && doubleJump != noJump) {
    doubleJump = doubleJumpScript;
}

if (jumpPressed) {
    jumpBuffer = MAXJUMPBUFFER;
    script_execute(doubleJump);
}

if (dashPressed && dashes > 0) {
    dashTimer = 3;
}

if (dashHeld) {
    dashTimer--;
}

// dash
if (dashTimer == 0) {
    dashTimer = -1;
    stateSwitch("dashStart", false);
}

script_execute(land);

script_execute(die);

