///dashCollect

if (place_meeting(x, y, objCollectible)) {
    applyTimeFactor(1);
    stateSwitch("inCollectionAnimation");
    collectStuff = collect;
    dash         = dashCheck;
}

if (place_meeting(x, y, objLevelEnd)) {
    applyTimeFactor(1);
    stateSwitch("ending");
}

