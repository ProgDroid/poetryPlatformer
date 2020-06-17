///stateWalk

if (state_new) {
    sprite_index = playerWalk;
    image_index  = 0;
    image_speed  = IMAGESPEED;
}

instance = instance_place(round(x), round(y), objFloors);
if (instance) {
    pushPlayerOut();
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

// if holding directional key
if (leftHeld || rightHeld) {
    if (leftHeld && rightHeld) {
        stateSwitch("idle");
    }

    if (rightHeld) {
        image_xscale = 1;
    } else if (leftHeld) {
        image_xscale = -1;    
    }

    // check for slide
    var accelerationTmp = acceleration;
    
    if ((horizontalSpeed < 0 && rightHeld) ||
        (horizontalSpeed > 0 && leftHeld))
    {
        accelerationTmp *= slideFactor;
    }
    
    // accelerate
    if (-maxHorizontalSpeed < horizontalSpeed < maxHorizontalSpeed) {
        horizontalSpeed += (rightHeld - leftHeld) * accelerationTmp * customDeltaTime;
        horizontalSpeed = clamp(horizontalSpeed, -maxHorizontalSpeed, maxHorizontalSpeed);
    }
} else { // if not holding keys
    if (horizontalSpeed < 0) {
        horizontalSpeed += acceleration * customDeltaTime;
        if (horizontalSpeed > 0) {
            horizontalSpeed = 0;
        }
    } else if (horizontalSpeed > 0) {
        horizontalSpeed -= acceleration * customDeltaTime;
        if (horizontalSpeed < 0) {
            horizontalSpeed = 0;
        }
    }
}

// if stopped, idle
if (horizontalSpeed == 0) {
    stateSwitch("idle");
} else { // change sprite
    // face right direction
    //if (rightHeld)
    //{
    //    image_xscale = 1;
    //    facingDir = 1;
    //} // if
    //else if (leftHeld)
    //{
    //    image_xscale = -1;
    //    facingDir = -1;
    //} // else if
    
    // slide sprite ??????
    /*
    if (horizontalSpeed < 0 && rightHeld ||
        horizontalSpeed > 0 && leftHeld)
    {
        sprite_index = spr_player_slide;
    } // if
    */
}

// no floor
if (!(jumpPressed || jumpHeld) && !place_meeting(round(x) - sign(horizontalSpeed), round(y) + 1, objBottoms) ||
    !(jumpPressed || jumpHeld) && !place_meeting(round(x), round(y) + 1, objBottoms)
) {
    stateSwitch("drop");
}

// jump
if ((jumpPressed || jumpHeld) && place_meeting(round(x) - sign(horizontalSpeed), round(y) + 1, objBottoms) ||
    (jumpPressed || jumpHeld) && place_meeting(round(x), round(y) + 1, objBottoms)
) {
    stateSwitch("jump");
}

// drop from platform
if (downPressed && place_meeting(round(x), round(y) + 1, objPlatforms)) {
    stateSwitch("drop");
}

instance = instance_place(round(x), round(y), objCollectible);
if (instance != noone) {
    stateSwitch("inCollectionAnimation");
}

// dash
/*
if (dashPressed)
{
    state_switch("dash");
} // if
*/

// charge the jump
/*
if (jumpHeld)
{
    jumpCharge++; // (STATE???)
} // if
*/

