///@description Aim and wait for dash confirmation

dashPressedTimer++;

applyTimeFactor(lerp(timeFactorController.timeFactor, 0.05, 0.5 * timeFactorController.timeFactor * timeFactorController.pauseFactor));

var lerpValue  = 0.15 * (inputController.currentInputType == inputmethod.keyboard);
    lerpValue += 0.05 * (inputController.currentInputType == inputmethod.pad && inputController.playerDashAiming);

dashTraceLength = lerp(dashTraceLength, DASH_TRACE_LENGTH, lerpValue) * !(inputController.currentInputType == inputmethod.pad && !inputController.playerDashAiming);

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

