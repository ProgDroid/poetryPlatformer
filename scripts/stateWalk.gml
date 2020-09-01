///stateWalk

if (state_new) {
    state_new    = false;
    sprite_index = playerWalk;
    image_index  = 0;
    image_speed  = IMAGESPEED;
}

facingDir = rightHeld - leftHeld;

// push out
var instance = instance_place(round(x), round(y), objFloors);
if (instance != noone) {
    pushPlayerOut(instance);
}

instance = instance_place(round(x), round(y), objCollectible);
if (instance != noone) {
    stateSwitch("inCollectionAnimation");
}

// if holding directional key
if (leftHeld || rightHeld) {
    // check for slide
    var accelerationTmp = acceleration;
    
    if (horizontalSpeed != 0 &&
        sign(horizontalSpeed) != facingDir
    ) {
        accelerationTmp *= slideFactor;
    }

    horizontalMovement(accelerationTmp);
} else { // if not holding keys
    horizontalSpeed += (rightHeld - leftHeld) * acceleration * customDeltaTime;
    
    if (sign(horizontalSpeed) != facingDir) {
        horizontalSpeed = 0;
    }
}

// collisions
instance = instance_place(round(x) + (rightHeld - leftHeld) * horizontalSpeed, round(y), objFloors);

if (place_meeting(round(x) + (rightHeld - leftHeld) * horizontalSpeed, round(y), objFloors)) {
    // approach wall
    while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objFloors)) {
        x += sign(horizontalSpeed);
    }

    horizontalSpeed = 0;
} else {
    x += horizontalSpeed * customDeltaTime;
}

// if stopped, idle
if (horizontalSpeed == 0) {
    stateSwitch("idle");
}

// no floor
if (!(jumpPressed || jumpHeld) && !place_meeting(round(x) - sign(horizontalSpeed), round(y) + 1, objBottoms) ||
    !(jumpPressed || jumpHeld) && !place_meeting(round(x), round(y) + 1, objBottoms) ||
    (downPressed && place_meeting(round(x), round(y) + 1, objPlatforms))
) {
    stateSwitch("drop");
}

// jump
if ((jumpPressed || jumpHeld) && place_meeting(round(x) - sign(horizontalSpeed), round(y) + 1, objBottoms) ||
    (jumpPressed || jumpHeld) && place_meeting(round(x), round(y) + 1, objBottoms)
) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

