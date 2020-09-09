// Idle State

if (state_new) {
    state_new       = false;
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;
    image_speed     = IMAGESPEED;
    if (hp <= 3) {
        sprite_index = playerIdleCalm;
        if (hp == 1) {
            sprite_index = playerIdleChill;
        }
    }
}

var instance = instance_place(round(x), round(y), objFloors);
if (instance != noone) {
    pushPlayerOut(instance);
}

// walk if not against wall
if (!(leftHeld && rightHeld) &&
    ((leftHeld && !place_meeting(round(x) - 1, round(y), objFloors)) ||
     (rightHeld && !place_meeting(round(x) + 1, round(y), objFloors)))
) {
    stateSwitch("walk");
}

// platform ran away from under you
if (!place_meeting(round(x), round(y) + 1, objBottoms)) {
    stateSwitch("drop");
}

// manually drop from platform
if ((downPressed || downHeld) && (jumpPressed || jumpHeld) && place_meeting(round(x), round(y) + 1, objPlatforms)) {
    stateSwitch("drop");
}

// regular jump
if (!(downPressed || downHeld) && (jumpPressed || jumpHeld) && place_meeting(round(x), round(y) + 1, objBottoms)) {
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

