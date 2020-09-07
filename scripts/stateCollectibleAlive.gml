if (place_meeting(round(x), round(y), objPlayer)) {
    eventFire(allEvents.collectiblefound, id);

    spawnLetters(self.name);
    
    stateSwitch("dying");
}

