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

    alarm[2] = -1;
    alarm[3] = -1;
    viewController.panOut           = false;
    viewController.offsetVertically = false;
    viewController.zoomIn           = false;
    flashController.dashDark        = false;

    moveHorizontal = walk;
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

// no floor
if (!isOnFloor() && !isSlidingOff()) {
    doubleJump = coyoteJump;
    stateSwitch("drop");
}

// jump
if ((jumpPressed || jumpBuffer > 0) && (isOnFloor() || isSlidingOff())) {
    verticalSpeed = -maxVerticalSpeed;
    doubleJump    = emptyScript;
    stateSwitch("drop");
}

