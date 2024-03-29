///stateDashThrough

if (state_new) {
    state_new = false;
    dashes--;
    viewController.zoomIn    = false;
    flashController.dashDark = false;
    applyTimeFactor(0);
    dashLerp = LERP_AMOUNT;

    collectStuff = dashCollect;
    land         = landScript;
    die          = dieScript;
}

var instance = instance_place(dashX, dashY, objPlatforms);

if (instance != noone && instance.visible) {
    dashX += lengthdir_x(MAXHORIZONTALSPEED, dashAngle);
    dashY += lengthdir_y(MAXHORIZONTALSPEED, dashAngle);
}

dashLerp = lerp(dashLerp, 0.15, LERP_AMOUNT * timeFactorController.pauseFactor);

viewController.viewXNoShift += lerp(x, dashX, dashLerp * timeFactorController.pauseFactor) - x;

x = lerp(x, dashX, dashLerp * timeFactorController.pauseFactor);
y = lerp(y, dashY, dashLerp * timeFactorController.pauseFactor);

script_execute(collectStuff);

if (x > dashX - 5 && x < dashX + 5 &&
    y > dashY - 5 && y < dashY + 5 &&
    (instance == noone || !instance.visible)
) {
    dash            = dashCheck;
    collectStuff    = collect;
    verticalSpeed   = 0;
    horizontalSpeed = 0;
    applyTimeFactor(1);
    stateSwitch("drop");
}

