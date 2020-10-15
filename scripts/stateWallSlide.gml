/// stateWallSlide

if (state_new) {
    state_new    = false;
    sprite_index = playerIdle; // needs its own sprite
    image_index  = 0;
}

animations();

var wallDir = rightHeld - leftHeld;

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = min(verticalSpeed, slidingOffSpeed);

if (((leftHeld ^^ rightHeld) && !isAgainstWallAir(rightHeld - leftHeld))) {
    stateSwitch("drop");
}

verticalCollisions();

//var instance = collision_line(bbox_left, bbox_top, bbox_left, bbox_top + 1, objPlatforms, true, true);
//if (instance != noone) {
//    move_outside_all(270, abs(offsetTop));
//}

horizontalCollisions();

if (wallDir == 0) {
    stateSwitch("drop");
    wallSlideBuffer = WALLSLIDEBUFFER;
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

if (jumpPressed || jumpHeld) {
    verticalSpeed = -maxVerticalSpeed;
    horizontalSpeed = -wallDir * maxHorizontalSpeed * 2;
    stateSwitch("drop");
}
