///stateDrop

if (state_new) {
    state_new    = false;
    sprite_index = playerJump;
    image_index  = 2;
    image_speed  = IMAGESPEED;
    platformId   = instance_place(round(x), round(y) + 1, objPlatforms);
    
    if (verticalSpeed == -maxVerticalSpeed) {
        image_index = 0;
        platformId = noone;
    }
}

facingDir = rightHeld - leftHeld;

var instance = instance_place(round(x), round(y), objFloors);
if (instance != noone) {
    pushPlayerOut(instance);
}

instance = instance_place(round(x), round(y), objCollectible);
if (instance != noone) {
    stateSwitch("inCollectionAnimation");
}

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = clamp(verticalSpeed, -maxVerticalSpeed, maxVerticalSpeed);

// air movement
if (!(leftHeld && rightHeld) &&
    ((rightHeld && !place_meeting(round(x) + 1, round(y), objFloors)) ||
     (leftHeld && !place_meeting(round(x) - 1, round(y), objFloors)))
) {
    image_xscale = facingDir;
    
    horizontalMovement(acceleration);
}

// collisions
instance = instance_place(round(x), round(y) + verticalSpeed, objBottoms);
if (instance != noone &&
    instance != platformId &&
    round(id.bbox_bottom) < instance.bbox_top)
{
    while (!place_meeting(round(x), round(y) + sign(verticalSpeed), objBottoms)) {
        y += sign(verticalSpeed);
    }
    
    verticalSpeed = 0;
    y += instance.bbox_top - bbox_bottom - 1;
} else {
    y += verticalSpeed * customDeltaTime;
}

if (horizontalSpeed != 0) {
    if (place_meeting(round(x) + horizontalSpeed, round(y), objFloors)) {

        var oldHSpeed = abs(horizontalSpeed);
        // approach wall
        while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objFloors)) {
            x += sign(horizontalSpeed);
            oldHSpeed -= abs(sign(horizontalSpeed));
            if (oldHSpeed < 0) {
                break;
            }
        }
        // stop at wall
        horizontalSpeed = 0
    } else {
        x += horizontalSpeed * customDeltaTime;
    }
}

instance = instance_place(round(x), round(y) + 1, objBottoms);
if (verticalSpeed == 0 && instance) {
    eventFire(allEvents.landedon, instance);

    if (horizontalSpeed != 0 || (leftHeld || rightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

if (bbox_top > (view_yview[0] + view_hview[0] + 50)) {
    hp -= 1;
    
    if (id.hp > 0) {
        x = xstart;
        y = ystart;
        stateSwitch("respawn");
    } else {
        game_end();
    }
}

