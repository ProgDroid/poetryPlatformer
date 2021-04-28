///@description Update the camera

// yikes
if (objPlayer.state_name = "inCollectionAnimation") {
    exit;
}

// view size
if (panOut) {
    panOutFactor = lerp(panOutFactor, panOutRatio, 0.01 * timeFactorController.timeFactor * timeFactorController.pauseFactor);
} else {
    panOutFactor = lerp(panOutFactor, 1, 0.01 * timeFactorController.timeFactor * timeFactorController.pauseFactor);
}

if (zoomIn) {
    zoomInFactor = lerp(zoomInFactor, zoomInRatio, 0.05 * timeFactorController.pauseFactor);
} else {
    zoomInFactor = lerp(zoomInFactor, 1, 0.05 * timeFactorController.pauseFactor);
}

view_hview[0] = originalHeight * panOutFactor * zoomInFactor;
view_wview[0] = originalWidth * panOutFactor * zoomInFactor;

// X axis
var limit = cameraLimitsRatio;

if (objPlayer.lastDir == -1) {
    limit = 1 - limit;
}

if (objPlayer.state_name == "ending") {
    limit = 0.5;
}

xShift = lerp(xShift, (inputController.cameraRight - inputController.cameraLeft) * viewShiftMax * !GUIController.gameOver * !objPlayer.dashHeld, 0.1);

var lerpValue = lerp(viewXNoShift, objPlayer.x - limit * view_wview[0], 0.05 + 0.05 * objPlayer.maxHorizontalSpeed * timeFactorController.timeFactor * timeFactorController.pauseFactor) - viewXNoShift;

if (abs(lerpValue) > abs(objPlayer.horizontalSpeed) + 1) {
    lerpValue = (abs(objPlayer.horizontalSpeed) + 1) * sign(lerpValue) * timeFactorController.timeFactor * timeFactorController.pauseFactor;
}

viewXNoShift += lerpValue;
view_xview[0] = viewXNoShift + xShift;

// Y axis
if (offsetVertically) {
    yOffset = lerp(yOffset, yOffsetMax, 0.01 * timeFactorController.timeFactor * timeFactorController.pauseFactor);
} else {
    yOffset = lerp(yOffset, 0, 0.1 * timeFactorController.timeFactor * timeFactorController.pauseFactor);
}

if (zoomIn) {
    dashOffset = clamp((mouse_y - objPlayer.y) / 3, -dashMaxOffset, dashMaxOffset);
} else {
    dashOffset = 0;
}

yShift = lerp(yShift, (inputController.cameraDown - inputController.cameraUp) * viewShiftMax * !GUIController.gameOver * !objPlayer.dashHeld * !offsetVertically, 0.1);

viewYNoShift  = lerp(viewYNoShift, (objPlayer.y - 0.5 * view_hview[0]) + yOffset * view_hview[0] + dashOffset, 0.05 + 0.05 * abs(objPlayer.verticalSpeed) * timeFactorController.timeFactor * timeFactorController.pauseFactor);
viewYNoShift  = min(viewYNoShift, room_height - view_hview[0] / 1.5);
view_yview[0] = viewYNoShift + yShift;

