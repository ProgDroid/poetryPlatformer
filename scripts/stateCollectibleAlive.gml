if (place_meeting(round(x), round(y), objPlayer)) {
    eventFire(allEvents.collectiblefound, id);

    spawnLetters(id.name);
    
    stateSwitch("dying");
}

