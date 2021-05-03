///stateDash

if (state_new) {
    state_new      = false;
    dashHeldBuffer = DASH_HELD_BUFFER;
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

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

if (inputController.playerDashConfirm) {
    inputController.playerDashConfirm = false;
    dashTraceLength = 0;
    stateSwitch("dashThrough", false);

    eventFire(allEvents.dashthrough);
}

if (dashHeldBuffer <= 0 || state_timer > TICK_RATE * 5) {
    dashTraceLength = 0;
    stateSwitch("dashCancelled", false);

    eventFire(allEvents.dashcancelled);
}

if (!inputController.playerDashHeld) {
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
