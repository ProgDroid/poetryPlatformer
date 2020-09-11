///stateInCollectionAnimation

if (state_new) {
    state_new   = false;
    alarm[0]    = room_speed * 3.75 * customDeltaTime;
    image_speed = 0;

    flashController.dark = true;
}

// increase value as alarm goes to 0
range = (3 - alarm[0] / room_speed) / 3;

view_xview[0] = random_range(-range, range);
view_yview[0] = random_range(-range, range);

