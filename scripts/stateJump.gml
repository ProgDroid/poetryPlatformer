///stateJump

if (state_new) {
    sprite_index  = playerJump;
    image_index   = 0;
    verticalSpeed = -maxVerticalSpeed;
}

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = clamp(verticalSpeed, -maxVerticalSpeed, maxVerticalSpeed);

// collisions
instance = instance_place(round(x), round(y) + verticalSpeed, objBottoms);
if (instance != noone &&
    sign(verticalSpeed) == 1 &&
    self.bbox_bottom < instance.bbox_top
) {
    while (!place_meeting(round(x), round(y) + sign(verticalSpeed), objBottoms)) {
        y += sign(verticalSpeed) * customDeltaTime;
    }
    
    verticalSpeed = 0;
} else {
    y += verticalSpeed * customDeltaTime;
}

// air movement
if ((rightHeld && !place_meeting(round(x) + 1, round(y), objFloors)) ||
    (leftHeld && !place_meeting(round(x) - 1, round(y), objFloors))) {
    if (rightHeld - leftHeld != 0) {
        image_xscale = rightHeld - leftHeld;
    }
    
    if (-maxHorizontalSpeed < horizontalSpeed < maxHorizontalSpeed) {
        horizontalSpeed += (rightHeld - leftHeld) * customDeltaTime;
        horizontalSpeed = clamp(horizontalSpeed, -maxHorizontalSpeed, maxHorizontalSpeed);
    }
}

if (horizontalSpeed != 0) {
    if (place_meeting(round(x) + horizontalSpeed, round(y), objFloors)) {

        // approach wall
        while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objFloors)) {
            x += sign(horizontalSpeed) * customDeltaTime;
        }
        // stop at wall
        horizontalSpeed = 0
    } else {
        x += horizontalSpeed * customDeltaTime;
    }
}

if (verticalSpeed == 0 && place_meeting(round(x), round(y) + 1, objBottoms)) {
    if (horizontalSpeed != 0 || (leftHeld || rightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

// if previous state is not jump or wall jump or any other jump
// if jump pressed
// jump state again
