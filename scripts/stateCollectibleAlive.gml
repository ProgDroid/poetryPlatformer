if (place_meeting(round(x), round(y), objPlayer)) {
    worldController.collectibles[? self.name] = true;
    worldController.collectiblesFound += 1;
    spawnLetters(self.name);
    
    stateSwitch("dying");
}

