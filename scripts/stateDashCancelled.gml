///stateDashCancelled

if (state_new) {
    state_new = false;
    viewController.zoomIn    = false;
    flashController.dashDark = false;
}

if (place_meeting(x, y, objCollectible)) {
    applyTimeFactor(1);
    stateSwitch("inCollectionAnimation");
}

if (place_meeting(x, y, objLevelEnd)) {
    applyTimeFactor(1);
    stateSwitch("ending");
}

applyTimeFactor(timeFactorController.timeFactor + (1 - timeFactorController.timeFactor) * 0.5 * timeFactorController.timeFactor);

if (timeFactorController.timeFactor >= 1) {
    applyTimeFactor(1);
    stateSwitchPrevious();
}

animations();

script_execute(facingDirection);

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

if (jumpBuffer > 0) {
    jumpBuffer -= 1;
}

if (jumpPressed) {
    jumpBuffer = MAXJUMPBUFFER;
}

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
    if (hp <= 3) {
        alarm[1] = room_speed * 0.5;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp == 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
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
