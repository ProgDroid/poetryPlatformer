if (state_new)
{
    sprite_index = spr_player_walk;
    image_index = 0;
} // if

// if holding directional key
if (leftHeld || rightHeld)
{
    // check for slide
    var accelerationTmp = acceleration;
    if ((hspd < 0 && rightHeld) ||
        (hspd > 0 && leftHeld))
    {
        accelerationTmp *= slideFactor;
    } // if
    
    // accelerate
    if (-maxHSpeed < hspd < maxHSpeed)
    {
        hspd += (rightHeld - leftHeld) * accelerationTmp;
        hspd = clamp(hspd, -maxHSpeed, maxHSpeed);
    } // if
} // if

// if not holding keys
else
{
    if (hspd < 0)
    {
        hspd += acceleration;
    } // if
    else if (hspd > 0)
    {
        hspd -= acceleration;
    } // else if
} // else

// if stopped, idle
if (hspd == 0)
{
    state_switch("idle");
} // if

// change sprite
else
{
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
    if (hspd < 0 && rightHeld ||
        hspd > 0 && leftHeld)
    {
        sprite_index = spr_player_slide;
    } // if
    */
} // else

// no floor
if (!place_meeting(round(x), round(y) + 1, obj_arena))
{
    state_switch("jump");
} // if

// collisions
if (place_meeting(round(x) + hspd, round(y), obj_arena))
{
//    round(x);
//    round(y);
    // approach wall
    while (!place_meeting(round(x) + sign(hspd), round(y), obj_arena))
    {
        x += sign(hspd);
    } // while
    // stop at wall
    hspd = 0
    state_switch("idle");
} // if
else
{
    x += hspd;
} // else

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

