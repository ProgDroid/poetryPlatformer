if (state_new) {
    state_new = false;
   
    image_xscale = 1;
    image_yscale = 1;

    image_index = (ord('z') - ord('a')) * 13 + 13;
    
    alarm[1] = room_speed;
}

if (image_index > ((ord('z') - ord('a')) * 13 + 17)) {
    image_index = (ord('z') - ord('a')) * 13 + 13;
}


