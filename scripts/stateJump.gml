if (state_new) {
    sprite_index = playerJump;
    /*
    if (jumpStrength != 0)
    {
        image_index = 0;
    } // if
    else
    {
        image_index = 23;
    } // else
    */
    image_index = 0;
    
    //if (jumpReleased || jumpHeld) {
        verticalSpeed = -6;
    //}
    //else {
    //    verticalSpeed = 0;
    //    image_index = 23;
    //}
}

verticalSpeed = min(verticalSpeed + grav, maxVerticalSpeed);

// collisions
if (place_meeting(round(x), round(y) + verticalSpeed, objPlatforms) /*||
    place_meeting(round(x) + 1, round(y) + verticalSpeed, obj_wall)*/)
{
    while (!place_meeting(round(x), round(y) + sign(verticalSpeed), objPlatforms)) {
        y += sign(verticalSpeed);
    }
    
    verticalSpeed = 0;
} else {
    y += verticalSpeed;
}

// proper sprite animation
/*
if (verticalSpeed >= 0)
{
    image_index = 23;
} // if

else
{
    image_index = 0;
} // else
*/

// air movement
if ((rightHeld && !place_meeting(round(x) + 1, round(y), objPlatforms)) ||
    (leftHeld && !place_meeting(round(x) - 1, round(y), objPlatforms)))
{
    if (rightHeld - leftHeld != 0) {
        image_xscale = rightHeld - leftHeld;
    }
    
    if (-maxHorizontalSpeed < horizontalSpeed < maxHorizontalSpeed) {
        horizontalSpeed += (rightHeld - leftHeld) * acceleration;
        horizontalSpeed = clamp(horizontalSpeed, -maxHorizontalSpeed, maxHorizontalSpeed);
    }
}

if (horizontalSpeed != 0) {
    if (place_meeting(round(x) + horizontalSpeed, round(y), objPlatforms)) {
//    round(x);
//    round(y);
    // approach wall
    while (!place_meeting(round(x) + sign(horizontalSpeed), round(y), objPlatforms)) {
        x += sign(horizontalSpeed);
    }
    // stop at wall
    horizontalSpeed = 0
    } else {
        x += horizontalSpeed;
    }
}

if (verticalSpeed == 0 && place_meeting(round(x), round(y) + 1, objPlatforms)) {
    if (rightHeld || leftHeld) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

// if previous state is not jump or wall jump or any other jump
// if jump pressed
// jump state again
