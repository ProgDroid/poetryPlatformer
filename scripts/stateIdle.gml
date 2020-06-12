// Idle State
if (state_new) {
    horizontalSpeed = 0;
    verticalSpeed   = 0;
    sprite_index    = playerIdle;
    image_index     = 0;
    image_speed     = 1 / (room_speed * 0.1);
}

// walk if not against wall
if (((leftHeld && !place_meeting(round(x) - 1, round(y), objPlatforms)) ||
    (rightHeld && !place_meeting(round(x) + 1, round(y), objPlatforms))) &&
     !(leftHeld && rightHeld))
{
    stateSwitch("walk");
}

// charge the jump
/*
if (jumpHeld)
{
    if (jumpCharge < maxJumpCharge)
    {
        jumpCharge++;
    } // if
} // if
*/

// jump after charge
/*
if (jumpCharge != 0 && jumpReleased &&
    place_meeting(round(x), round(y) + 1, obj_floor))
{
    state_switch("highJump"); // (REGULAR JUMP WITH STRENGTH???)
} // if
*/

// regular jump
if ((jumpPressed || jumpHeld) && place_meeting(round(x), round(y) + 1, objPlatforms)) {
    stateSwitch("jump");
}

// in case floor moves from under player
/*if (!position_meeting(round(x), round(y) + 1, obj_floor)) ||
    !position_meeting(round(x), round(y) + 1, obj_floor))
{
    state_switch("jump");
} // if
*/
// backdash
/*
if (dashPressed && !position_meeting(round(x) - sign(facingDir), round(y), obj_wall))
{
    state_switch("backDash");
} // if
*/
