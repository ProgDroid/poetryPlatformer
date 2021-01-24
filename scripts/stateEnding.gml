///stateEnding

if (state_new) {
    state_new    = false;
    sprite_index = playerIdle;
    image_index  = 0;
    alarm[2]     = -1;
    alarm[3]     = -1;

    viewController.panOut           = false;
    viewController.offsetVertically = false;
    viewController.zoomIn           = false;
    flashController.dashDark        = false;
}

move_towards_point(objLevelEnd.x, objLevelEnd.y - 63, 1);

image_alpha = lerp(image_alpha, 0, 0.01);

if (image_alpha <= 0.1) {
    eventFire(allEvents.gameending);
}

