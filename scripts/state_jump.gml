if (state_new)
{
    sprite_index = spr_player_jump;
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
    
    if (jumpReleased || jumpHeld)
    {
        vspd = -6;
    } // if
    else
    {
        vspd = 0;
        image_index = 23;
    } // else
} // if

vspd = min(vspd + grav, maxVSpeed);

// collisions
if (place_meeting(round(x), round(y) + vspd, obj_arena) /*||
    place_meeting(round(x) + 1, round(y) + vspd, obj_wall)*/)
{
    while (!place_meeting(round(x), round(y) + sign(vspd), obj_arena))
    {
        y += sign(vspd);
    } // while
    
    vspd = 0;
} // if
else
{
    y += vspd;
} // else

// proper sprite animation
/*
if (vspd >= 0)
{
    image_index = 23;
} // if

else
{
    image_index = 0;
} // else
*/

// air movement
if ((rightHeld && !place_meeting(round(x) + 1, round(y), obj_arena)) ||
    (leftHeld && !place_meeting(round(x) - 1, round(y), obj_arena)))
{
    if (rightHeld - leftHeld != 0)
    {
        image_xscale = rightHeld - leftHeld;
    } // if
    
    if (-maxHSpeed < hspd < maxHSpeed)
    {
        hspd += (rightHeld - leftHeld) * acceleration;
        hspd = clamp(hspd, -maxHSpeed, maxHSpeed);
    } // if
} // if

if (hspd != 0)
{
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
    } // if
    else
    {
        x += hspd;
    } // else
} // if

if (vspd == 0 && place_meeting(round(x), round(y) + 1, obj_arena))
{
    if (rightHeld || leftHeld)
    {
        state_switch("walk");
    } // if
    else
    {
        state_switch("idle");
    } // else
} // if

// if previous state is not jump or wall jump or any other jump
// if jump pressed
// jump state again
