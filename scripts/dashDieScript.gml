///dashDieScript

if (bbox_top > (room_height + 50)) {
    dashTraceLength = 0;
    applyTimeFactor(1);
    eventFire(allEvents.playerfell);
}

