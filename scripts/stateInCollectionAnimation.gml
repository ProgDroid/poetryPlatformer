///stateInCollectionAnimation

if (state_new) {
    state_new = false;

    createAlarm(flashController, TICK_RATE * 3.75, resetViewFlash, false);
    resetViewAlarmIndex = createAlarm(id, TICK_RATE * 3.75, resetView, false);

    delayAlarm(playerSpeedAlarmIndex, TICK_RATE * 3.75, refreshPlayerSpeed);

    applyTimeFactor(1);

    flashController.dark = true;

    oldViewX = view_xview[0];
    oldViewY = view_yview[0];

    doubleJump  = doubleJumpScript;
    dashes      = maxDashes;

    cancelAlarm(offsetVertAlarmIndex, setOffsetVertically);
    viewController.offsetVertically = false;

    image_speed = 0;
}

// increase value as alarm goes to 0
var range = (3 - alarmController.alarmTimes[resetViewAlarmIndex] / TICK_RATE) / 3;

view_xview[0] = random_range(-range, range) + oldViewX;
view_yview[0] = random_range(-range, range) + oldViewY;

