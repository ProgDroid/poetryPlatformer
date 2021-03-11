///collect

if (place_meeting(x, y, objCollectible)) {
    stateSwitch("inCollectionAnimation");
}

if (place_meeting(x, y, objLevelEnd)) {
    stateSwitch("ending");
}

