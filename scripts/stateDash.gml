///stateDash

if (state_new) {
    state_new      = false;
    dashHeldBuffer = 5;
    alarm[3]       = -1;
    noCoyote       = true;

    viewController.offsetVertically = false;
    viewController.zoomIn           = true;
    flashController.dashDark        = true;
    flashController.dashDarkFactor  = 0.1;

    eventFire(allEvents.dashheld);

    dashTraceLength = 0;
}

applyTimeFactor(lerp(timeFactorController.timeFactor, 0.05, 0.5 * timeFactorController.timeFactor));

dashTraceLength = lerp(dashTraceLength, DASH_TRACE_LENGTH, 0.15);

if (dashConfirm) {
    dashTraceLength = 0;
    stateSwitch("dashThrough", false);

    eventFire(allEvents.dashthrough);
}

if (dashHeldBuffer <= 0 || state_timer > 300) {
    dashTraceLength = 0;
    stateSwitch("dashCancelled", false);

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

verticalSpeed += gravTmp * timeFactorController.timeFactor;
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
    horizontalSpeed -= speedSign * airDeceleration * timeFactorController.timeFactor;

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
        alarm[1] = room_speed * 0.5 * timeFactorController.timeFactor;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp == 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        }
    }

    if (horizontalSpeed != 0 || (leftHeld ^^ rightHeld)) {
        dashTraceLength = 0;
        applyTimeFactor(1);
        stateSwitch("walk");
    } else {
        dashTraceLength = 0;
        applyTimeFactor(1);
        stateSwitch("idle");
    }
}

if (bbox_top > (room_height + 50)) {
    dashTraceLength = 0;
    applyTimeFactor(1);
    eventFire(allEvents.playerfell);
}
