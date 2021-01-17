///stateInCollectionAnimation

if (state_new) {
    state_new   = false;
    alarm[0]    = room_speed * 3.75 * customDeltaTime;
    image_speed = 0;

    flashController.dark     = true;
    
    oldViewX = view_xview[0];
    oldViewY = view_yview[0];
    
    doubleJumps = MAXDOUBLEJUMPS;
    dashes      = maxDashes;
    
    alarm[3] = -1;
    viewController.offsetVertically = false;
}

// increase value as alarm goes to 0
var range = (3 - alarm[0] / room_speed) / 3;

view_xview[0] = random_range(-range, range) + oldViewX;
view_yview[0] = random_range(-range, range) + oldViewY;

