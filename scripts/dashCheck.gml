///@description Check for dash input

if (inputController.playerDashPressed && dashes > 0) {
    inputController.playerDashPressed = false;
    dashTimer = 3;

    panOutAlarmIndex      = cancelAlarm(panOutAlarmIndex, setPanOut);
    viewController.panOut = false;
}

if (inputController.playerDashHeld) {
    dashTimer--;
}

// dash
if (dashTimer == 0) {
    dashTimer        = -1;
    dashPressedTimer = 0;
    dash             = dashScript;
    land             = dashLandScript;

    dashHeldBuffer       = DASH_HELD_BUFFER;
    offsetVertAlarmIndex = cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);

    viewController.offsetVertically = false;
    viewController.zoomIn           = true;
    flashController.dashDark        = true;
    flashController.dashDarkFactor  = 0.1;

    eventFire(allEvents.dashheld);

    dashTraceLength = 0;

    die  = dashDieScript;
}

