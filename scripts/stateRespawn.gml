if (state_new) {
    state_new    = false;
    sprite_index = playerIdle;
    image_index  = 0;
    image_speed  = 0;
}

if (state_timer >= room_speed * customDeltaTime) {
    stateSwitch("idle");
}

