///stateDashThrough

if (state_new) {
    state_new = false;
    dashes--;
    viewController.zoomIn    = false;
    flashController.dashDark = false;
    applyTimeFactor(0);
    dashLerp = LERP_AMOUNT;
}

var instance = instance_place(dashX, dashY, objPlatforms);

if (instance != noone && instance.visible) {
    dashX += lengthdir_x(MAXHORIZONTALSPEED, dashAngle);
    dashY += lengthdir_y(MAXHORIZONTALSPEED, dashAngle);
}

dashLerp = lerp(dashLerp, 0.15, LERP_AMOUNT);

viewController.viewXNoShift += lerp(x, dashX, dashLerp) - x;

x = lerp(x, dashX, dashLerp);
y = lerp(y, dashY, dashLerp);

if (place_meeting(x, y, objCollectible)) {
    applyTimeFactor(1);
    stateSwitch("inCollectionAnimation");
}

if (place_meeting(x, y, objLevelEnd)) {
    applyTimeFactor(1);
    stateSwitch("ending");
}

if (x > dashX - 5 && x < dashX + 5 &&
    y > dashY - 5 && y < dashY + 5 &&
    (instance == noone || !instance.visible)
) {
    verticalSpeed   = 0;
    horizontalSpeed = 0;
    noCoyote        = true;
    applyTimeFactor(1);
    stateSwitch("drop");
}

