if (place_meeting(round(x), round(y), objPlayer) && objPlayer.dash != dashScript) {
    eventFire(allEvents.collectiblefound, id);

    spawnLetters(id.name);

    stateSwitch("dying");
}

