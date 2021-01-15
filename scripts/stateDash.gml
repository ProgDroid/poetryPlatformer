///stateDash

if (state_new) {
    state_new      = false;
    dashHeldBuffer = 5;
    viewController.offsetVertically = false;
    alarm[3] = -1;

    eventFire(allEvents.dashheld);
}

applyTimeFactor(lerp(timeFactorController.timeFactor, 0.05, 0.5 * customDeltaTime));

if (dashConfirm) {
    stateSwitch("dashThrough");

    eventFire(allEvents.dashthrough);
}

if (dashHeldBuffer <= 0 || state_timer > 300) {
    stateSwitch("dashCancelled");

    eventFire(allEvents.dashcancelled);
}

if (!dashHeld) {
    dashHeldBuffer--;
}

animations();

facingDir = rightHeld - leftHeld;

if (facingDir != 0) {
    lastDir = facingDir;
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
        applyTimeFactor(1);
        stateSwitch("walk");
    } else {
        applyTimeFactor(1);
        stateSwitch("idle");
    }
}

if (bbox_top > (room_height + 50)) {
    applyTimeFactor(1);
    eventFire(allEvents.playerfell);
}

