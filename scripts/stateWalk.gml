///stateWalk

if (state_new) {
    sprite_index = playerWalk;
    image_index  = 0;
    //image_speed  = 1 / (room_speed * 0.1);
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

// collisions
instance = instance_place(round(x) + (rightHeld - leftHeld) * horizontalSpeed, round(y), objFloors);
if (place_meeting(round(x) + (rightHeld - leftHeld) * horizontalSpeed, round(y), objFloors)) {
    // approach wall
    while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objFloors)) {
        x += sign(horizontalSpeed);
    }
    
    if (self.bbox_bottom - 15 < instance.bbox_top) {
        y += instance.bbox_top - bbox_bottom - 1;
        x += 5;
    } else {
        horizontalSpeed = 0;
    }
} else {
    x += horizontalSpeed * customDeltaTime;
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

