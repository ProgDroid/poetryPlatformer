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
    alarm[3] = room_speed * 3 * customDeltaTime;
    viewController.panOut = false;
}

animations();

facingDir = rightHeld - leftHeld;

if (facingDir != 0) {
    lastDir = facingDir;
}

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

var gravTmp = grav;

if (jumpHeld && abs(verticalSpeed) < 1) {
    gravTmp /= 2;
}

verticalSpeed += gravTmp * customDeltaTime;
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
} else { // if not holding keys
    var speedSign    = sign(horizontalSpeed);
    horizontalSpeed -= speedSign * airDeceleration * customDeltaTime;
    
    if (sign(horizontalSpeed) != speedSign) {
        horizontalSpeed = 0;
    }
}

// collisions
verticalCollisions();

if (place_meeting(x, y, objPlatforms)) {
    if (!place_meeting(x - abs(offsetRight), y, objPlatforms)) {
        x -= 1;
    } else if (!place_meeting(x + abs(offsetLeft), y, objPlatforms)) {
        x += 1;
    }
}

horizontalCollisions();

if (jumpBuffer > 0) {
    jumpBuffer -= 1;
}

if (jumpPressed) {
    jumpBuffer = maxJumpBuffer;
}

if (jumpPressed && state_timer <= coyoteTime && verticalSpeed >= 0 && horizontalSpeed != 0) {
    y -= state_timer div 2;

    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

// double jump
if (jumpPressed && state_timer > doubleJumpTime && doubleJumps > 0) {
    verticalSpeed = -maxVerticalSpeed;
    doubleJumps -= 1;
    image_index = 0;
    drawingScaleX = 0.75 - 0.05;
    drawingScaleY = 1.35 + 0.05;
    image_speed   = 0;
    stateSwitch("drop");
    eventFire(allEvents.doublejump);
}

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
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

if (bbox_top > (room_height + 50)) {
    eventFire(allEvents.playerfell);
}

