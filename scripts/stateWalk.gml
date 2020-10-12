///stateWalk

if (state_new) {
    state_new    = false;
    sprite_index = playerWalk;
    image_index  = 0;

    if (hp <= 3) {
        sprite_index = playerWalkCalm;
        if (hp == 1) {
            sprite_index = playerWalkChill;
        }
    }
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
if (!(jumpPressed || jumpHeld)) {
    if (!isOnFloor() && !isSlidingOff()) {
        stateSwitch("drop");
    } else if (!isOnFloor() && isSlidingOff()) {
        // do nothing for now
    }
}

// manually drop from platform
//if ((downPressed || downHeld) && jumpPressed && isOnFloor()) {
//    y += 1;
//    noCollision = true;
//    stateSwitch("drop");
//}

// jump
if (!(downPressed || downHeld) &&
    (jumpPressed || jumpHeld) &&
    (isOnFloor() || isSlidingOff())
) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

