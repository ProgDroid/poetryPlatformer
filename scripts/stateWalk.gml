///stateWalk

if (state_new) {
    state_new    = false;
    sprite_index = playerWalk;
    image_index  = 0;
    image_speed  = IMAGESPEED;
    if (hp <= 3) {
        sprite_index = playerWalkCalm;
        if (hp == 1) {
            sprite_index = playerWalkChill;
        }
    }
}

facingDir = rightHeld - leftHeld;

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

// if holding directional key
if (leftHeld ^^ rightHeld) {
    // check for slide
    var accelerationTmp = acceleration;
    
    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= slideFactor;
    }

    horizontalMovement(accelerationTmp);
} else { // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * deceleration * customDeltaTime;
    
    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
}

// collisions
horizontalCollisions();

// if stopped, idle
if (horizontalSpeed == 0) {
    stateSwitch("idle");
}

// no floor
if (!(jumpPressed || jumpHeld)) {
    if (!isOnFloor() && !isSlidingOff(objPlatforms)) {
        stateSwitch("drop");
    } else if (!isOnFloor() && isSlidingOff(objPlatforms)) {
        // do nothing for now
    }
}

// manually drop from platform
if ((downPressed || downHeld) && jumpPressed && isOnFloor(objPlatforms)) {
    y += 1;
    noCollision = true;
    stateSwitch("drop");
}

// jump
if (!(downPressed || downHeld) &&
    (jumpPressed || jumpHeld) &&
    (isOnFloor() || isSlidingOff(objPlatforms))
) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

