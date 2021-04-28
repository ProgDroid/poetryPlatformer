///stateDash

if (state_new) {
    state_new      = false;
    dashHeldBuffer = 5;
    alarm[3]       = -1;

    viewController.offsetVertically = false;
    viewController.zoomIn           = true;
    flashController.dashDark        = true;
    flashController.dashDarkFactor  = 0.1;

    eventFire(allEvents.dashheld);

    dashTraceLength = 0;

    land = dashLandScript;
    die  = dashDieScript;
}

applyTimeFactor(lerp(timeFactorController.timeFactor, 0.05, 0.5 * timeFactorController.timeFactor * timeFactorController.pauseFactor));

dashTraceLength = lerp(dashTraceLength, DASH_TRACE_LENGTH, 0.15);

if (dashConfirm) {
    dashTraceLength = 0;
    stateSwitch("dashThrough", false);

    eventFire(allEvents.dashthrough);
}

if (dashHeldBuffer <= 0 || state_timer > 300) {
    dashTraceLength = 0;
    stateSwitch("dashCancelled", false);

    eventFire(allEvents.dashcancelled);
}

if (!dashHeld) {
    dashHeldBuffer--;
}

animations();

script_execute(facingDirection);

script_execute(moveVertical);

script_execute(moveHorizontal);

// collisions
verticalCollisions();

script_execute(slideAlongWalls);

horizontalCollisions();

script_execute(land);

script_execute(die);
