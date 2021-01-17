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
    dashX += lengthdir_x(MAXHORIZONTALSPEED, dashAngle) * customDeltaTimeNoTimeFactor;
    dashY += lengthdir_y(MAXHORIZONTALSPEED, dashAngle) * customDeltaTimeNoTimeFactor;
}

dashLerp = lerp(dashLerp, 0.15, LERP_AMOUNT * customDeltaTimeNoTimeFactor);

view_xview[0] += lerp(x, dashX, dashLerp * customDeltaTimeNoTimeFactor) - x;

x = lerp(x, dashX, dashLerp * customDeltaTimeNoTimeFactor);
y = lerp(y, dashY, dashLerp * customDeltaTimeNoTimeFactor);

if (place_meeting(x, y, objCollectible)) {
    applyTimeFactor(1);
    stateSwitch("inCollectionAnimation");
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

