///@description Land while aiming dash
/// Ideally it would continue with the aiming dash but lots of issues with the landing
/// because spaghetti

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
    if (hp <= 3) {
        playerSpeedAlarmIndex = createAlarm(id, TICK_RATE * 0.5, refreshPlayerSpeed);
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp <= 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        }
    }
    
    dashTraceLength = 0;
    applyTimeFactor(1);

    dash = dashCheck;

    viewController.zoomIn    = false;
    flashController.dashDark = false;

    if (horizontalSpeed != 0 || (inputController.playerLeftHeld ^^ inputController.playerRightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

