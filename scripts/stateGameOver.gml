if (state_new) {
    state_new    = false;
    sprite_index = playerDead;
    image_index  = 0;
    image_speed  = IMAGESPEEDNOTIME;
    x            = view_wview[0] / 2;
    y            = view_hview[0] / 2 + 69;
    image_xscale = 2;
    image_yscale = 2;
    depth        = -101;
}

if (floor(image_index) == 24) {
    image_index = 25;
    image_speed = 0;
}

if (jumpPressed) {
    with(all) {
        if (!persistent) {
            instance_destroy();
        }
    }
    gameRestart();
}

