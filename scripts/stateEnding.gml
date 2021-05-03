///stateEnding

if (state_new) {
    state_new    = false;
    sprite_index = playerIdle;
    image_index  = 0;

    panOutAlarmIndex     = cancelAlarm(panOutAlarmIndex, setPanOut);
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

    viewController.panOut           = false;
    viewController.offsetVertically = false;
    viewController.zoomIn           = false;
    flashController.dashDark        = false;
}

if (point_distance(objLevelEnd.x, objLevelEnd.y - 63, x, y) > 5) {
    move_towards_point(objLevelEnd.x, objLevelEnd.y - 63, customDeltaTime);
} else {
    speed = 0;
}

image_alpha = lerp(image_alpha, 0, 0.01);

if (image_alpha <= 0.1) {
    eventFire(allEvents.gameending);
}

