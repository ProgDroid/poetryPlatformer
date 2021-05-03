///landScript

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
    if (hp <= 3) {
        createAlarm(id, TICK_RATE * 0.5, refreshPlayerSpeed);
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp <= 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        }
    }

    if (horizontalSpeed != 0 || (inputController.playerLeftHeld ^^ inputController.playerRightHeld)) {
        stateSwitch("walk");
    } else {
        stateSwitch("idle");
    }
}

