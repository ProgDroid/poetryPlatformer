///stateInCollectionAnimation

if (state_new) {
    state_new = false;

    createAlarm(flashController, TICK_RATE * 3.75, resetViewFlash);
    resetViewAlarmIndex = createAlarm(id, TICK_RATE * 3.75, resetView);

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
var range = (3 - alarmController.alarmTimes[resetViewAlarmIndex] / room_speed) / 3;

view_xview[0] = random_range(-range, range) + oldViewX;
view_yview[0] = random_range(-range, range) + oldViewY;

