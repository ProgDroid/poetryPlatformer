///stateDrop

if (state_new) {
    state_new    = false;
    sprite_index = playerJump;
    image_index  = 2;
    jumpBuffer   = 0;

    if (verticalSpeed == -maxVerticalSpeed) {
        image_index = 0;
        drawingScaleX = JUMP_TRANSFORM_X;
        drawingScaleY = JUMP_TRANSFORM_Y;
        image_speed   = 0;
    }

    panOutAlarmIndex         = cancelAlarm(panOutAlarmIndex, setPanOut);
    offsetVertAlarmIndex     = createAlarm(viewController, TICK_RATE, setOffsetVertically);
    viewController.panOut    = false;
    viewController.zoomIn    = false;
    flashController.dashDark = false;

    moveHorizontal = airWalk;
    land           = landScript;
    die            = dieScript;
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

script_execute(dash);

if (
    dash != inDash &&
    inputController.playerJumpPressed
) {
    inputController.playerJumpPressed = false;
    jumpBuffer = MAXJUMPBUFFER;
    script_execute(doubleJump);
}

script_execute(land);

script_execute(die);

