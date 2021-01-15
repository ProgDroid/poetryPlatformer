if (place_meeting(round(x), round(y), objPlayer) && objPlayer.state_name != "dashStart") {
    eventFire(allEvents.collectiblefound, id);

    spawnLetters(id.name);

    stateSwitch("dying");
}

