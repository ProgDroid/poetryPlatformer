///stateDrop

if (state_new) {
    state_new    = false;
    sprite_index = playerJump;
    image_index  = 2;
    
    if (verticalSpeed == -maxVerticalSpeed) {
        image_index = 0;
        drawingScaleX = 0.85;
        drawingScaleY = 1.25;
        image_speed   = 0;
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

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = clamp(verticalSpeed, -maxVerticalSpeed, maxVerticalSpeed);

// air movement
if (((leftHeld ^^ rightHeld) && !isAgainstWallAir(rightHeld - leftHeld))) {
    var accelerationTmp = acceleration;
    
    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= airFrictionFactor;
    }
    
    horizontalMovement(accelerationTmp);
} else if (
    (leftHeld ^^ rightHeld) &&
    isAgainstWallAir(rightHeld - leftHeld) &&
    verticalSpeed > 0
) {
    stateSwitch("wallSlide");
} else { // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * airDeceleration * customDeltaTime;
    
    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
}

// collisions
verticalCollisions();

horizontalCollisions();

if (state_timer <= coyoteTime && jumpPressed && verticalSpeed >= 0 && horizontalSpeed != 0) {
    y -= state_timer div 2;

    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

if (wallSlideBuffer > 0) {
    if (jumpPressed && (checkWallSlide(-1) ^^ checkWallSlide(1))) {
        verticalSpeed   = -maxVerticalSpeed;
        stateSwitch("drop");
    }

    wallSlideBuffer -= 1;
}

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

if (verticalSpeed == 0 && isSlidingOff()) {
    stateSwitch("slidingOff");
}

if (bbox_top > (view_yview[0] + view_hview[0] + 50)) {
    eventFire(allEvents.playerfell);
}

