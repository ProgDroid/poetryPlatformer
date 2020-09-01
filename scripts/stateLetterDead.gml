if (state_new) {
    state_new = false;
   
    image_xscale = 1;
    image_yscale = 1;

    image_index = (ord('z') - ord('a')) * 13 + 13;
}

if (state_timer > room_speed * customDeltaTime) {
    instance_destroy();
}

if (image_index > ((ord('z') - ord('a')) * 13 + 17)) {
    image_index = (ord('z') - ord('a')) * 13 + 13;
}


