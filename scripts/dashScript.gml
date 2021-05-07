///@description Aim and wait for dash confirmation

dashPressedTimer++;

applyTimeFactor(lerp(timeFactorController.timeFactor, 0.05, 0.5 * timeFactorController.timeFactor * timeFactorController.pauseFactor));

dashTraceLength = lerp(dashTraceLength, DASH_TRACE_LENGTH, 0.15);

if (inputController.playerDashConfirm) {
    inputController.playerDashConfirm = false;

    dashTraceLength = 0;
    dash            = inDash;
    land            = landScript;
    stateSwitch("dashThrough", false);

    eventFire(allEvents.dashthrough);
}

if (dashHeldBuffer <= 0 || dashPressedTimer > TICK_RATE * 5) {
    dashTraceLength = 0;
    dash            = dashCancelledScript;
    land            = landScript;
    
    viewController.zoomIn    = false;
    flashController.dashDark = false;

    eventFire(allEvents.dashcancelled);
}

if (!inputController.playerDashHeld) {
    dashHeldBuffer--;
}

