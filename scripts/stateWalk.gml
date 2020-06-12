if (state_new) {
    sprite_index = playerWalk;
    image_index = 0;
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
        horizontalSpeed += (rightHeld - leftHeld) * accelerationTmp;
        horizontalSpeed = clamp(horizontalSpeed, -maxHorizontalSpeed, maxHorizontalSpeed);
    }
} else { // if not holding keys
    if (horizontalSpeed < 0) {
        horizontalSpeed += acceleration;
    } else if (horizontalSpeed > 0) {
        horizontalSpeed -= acceleration;
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
if (!place_meeting(round(x) - 2, round(y) + 1, objPlatforms)) {
    stateSwitch("jump");
}

// collisions
if (place_meeting(round(x) + horizontalSpeed, round(y), objPlatforms)) {
//    round(x);
//    round(y);
    // approach wall
    while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objPlatforms)) {
        x += sign(horizontalSpeed);
    } // while
    // stop at wall
    horizontalSpeed = 0
    stateSwitch("idle");
} else {
    x += horizontalSpeed;
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

