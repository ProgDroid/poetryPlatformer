if (state_new) {
    state_new    = false;
    sprite_index = playerIdle;
    image_index  = 0;
    image_speed  = 0;
    x            = xstart;
    y            = ystart;
    image_xscale = 1 * PLAYERSCALE;
    image_yscale = 1 * PLAYERSCALE;
    depth        = -10;
}

if (state_timer >= TICK_RATE * customDeltaTime) {
    stateSwitch("idle");
}

