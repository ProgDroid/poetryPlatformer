///stateDrop

if (state_new) {
    state_new    = false;
    sprite_index = playerJump;
    image_index  = 2;
    image_speed  = IMAGESPEED;
    
    if (verticalSpeed == -maxVerticalSpeed) {
        image_index = 0;
    }
}

facingDir = rightHeld - leftHeld;

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

// maybe add check for horizontalSpeed not being 0
if (state_timer <= coyoteTime && jumpPressed && verticalSpeed >= 0) {
    y -= state_timer div 2;
    verticalSpeed = -maxVerticalSpeed;
    stateSwitch("drop");
}

verticalSpeed += grav * customDeltaTime;
verticalSpeed  = clamp(verticalSpeed, -maxVerticalSpeed, maxVerticalSpeed);

// air movement
if (!(leftHeld && rightHeld) &&
    ((leftHeld || rightHeld) && !isAgainstWall(rightHeld - leftHeld))
) {
    if (image_speed != 0) {
        image_xscale = facingDir;
    }
    
    horizontalMovement(acceleration);
}

// collisions
verticalCollisions();

if (horizontalSpeed != 0) {
    horizontalCollisions();
}

var instance = instance_place(round(x), round(y) + 1, objBottoms);
if (verticalSpeed == 0 && instance) {
    eventFire(allEvents.landedon, instance);
    
    if (hp <= 3) {
        alarm[1] = room_speed * 0.5 * customDeltaTime;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        if (hp == 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 1;
        }
    }

    if (horizontalSpeed != 0 || (leftHeld || rightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

if (bbox_top > (view_yview[0] + view_hview[0] + 50)) {
    eventFire(allEvents.playerfell);
}

