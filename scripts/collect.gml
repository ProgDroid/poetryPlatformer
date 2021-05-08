///collect

if (place_meeting(x, y, objCollectible) && dash != dashScript) {
    stateSwitch("inCollectionAnimation");
}

if (place_meeting(x, y, objLevelEnd)) {
    stateSwitch("ending");
}

