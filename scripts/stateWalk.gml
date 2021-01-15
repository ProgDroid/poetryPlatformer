///stateWalk

if (state_new) {
    state_new    = false;
    sprite_index = playerWalk;
    image_index  = 0;
    doubleJumps  = maxDoubleJumps;

    if (hp <= 3) {
        sprite_index = playerWalkCalm;
        if (hp == 1) {
            sprite_index = playerWalkChill;
        }
    }
    
    alarm[2] = -1;
    alarm[3] = -1;
    viewController.panOut = false;
    viewController.offsetVertically = false;
}

animations();

facingDir = rightHeld - leftHeld;

if (facingDir != 0) {
    lastDir = facingDir;
}

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

// if holding directional key
if (leftHeld ^^ rightHeld && !isAgainstWall(rightHeld - leftHeld)) {
    // check for slide
    var accelerationTmp = acceleration;
    
    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= slideFactor;
    }

    horizontalMovement(accelerationTmp);
} else if (!isAgainstWall(sign(horizontalSpeed))){ // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * deceleration * customDeltaTime;
    
    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
} else if (isAgainstWall(rightHeld - leftHeld)) {
    // push
    show_debug_message("pushing");
}

// collisions
horizontalCollisions();

// if stopped, idle
if (horizontalSpeed == 0) {
    stateSwitch("idle");
}

// no floor
if (!isOnFloor() && !isSlidingOff()) {
    stateSwitch("drop");
}

// jump
if ((jumpPressed || jumpBuffer > 0) && (isOnFloor() || isSlidingOff())) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

