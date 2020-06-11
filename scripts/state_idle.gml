// Idle State
if (state_new)
{
    hspd = 0;
    vspd = 0;
    sprite_index = spr_player_idle;
    image_index = 0;
} // if

// walk if not against wall
if ((leftHeld && !place_meeting(round(x) - 1, round(y), obj_arena)) ||
     (rightHeld && !place_meeting(round(x) + 1, round(y), obj_arena)))
{
    if (rightPressed)
    {
        image_xscale = 1;
    } // if
    state_switch("walk");
} // if

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
if (upHeld && place_meeting(round(x), round(y) + 1, obj_arena))
{
    state_switch("jump");
} // if

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
