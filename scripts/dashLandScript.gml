///dashLandScript

if (verticalSpeed == 0 && (isOnFloor() || isSlidingOff())) {
    if (hp <= 3) {
        alarm[1] = room_speed * 0.5 * timeFactorController.timeFactor * timeFactorController.pauseFactor;
        image_speed = IMAGESPEED - 0.1;
        maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.33;
        if (hp <= 1) {
            maxHorizontalSpeed = MAXHORIZONTALSPEED - 0.66;
        }
    }

    if (horizontalSpeed != 0 || (leftHeld ^^ rightHeld)) {
        dashTraceLength = 0;
        applyTimeFactor(1);
        stateSwitch("walk");
    } else {
        dashTraceLength = 0;
        applyTimeFactor(1);
        stateSwitch("idle");
    }
}

