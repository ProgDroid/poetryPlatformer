///@description Update the camera

// view size
if (panOut) {
    panOutFactor = lerp(panOutFactor, panOutRatio, 0.01 * customDeltaTime);
} else {
    panOutFactor = lerp(panOutFactor, 1, 0.01 * customDeltaTime);
}

if (zoomIn) {
    zoomInFactor = lerp(zoomInFactor, zoomInRatio, 0.05 * customDeltaTimeNoTimeFactor);
} else {
    zoomInFactor = lerp(zoomInFactor, 1, 0.05 * customDeltaTimeNoTimeFactor);
}

view_hview[0] = originalHeight * panOutFactor * zoomInFactor;
view_wview[0] = originalWidth * panOutFactor * zoomInFactor;

// X axis
var limit = cameraLimitsRatio;

if (objPlayer.lastDir == -1) {
    limit = 1 - limit;
}

var lerpValue = lerp(view_xview[0], objPlayer.x - limit * view_wview[0], 0.05 + 0.05 * abs(objPlayer.horizontalSpeed) * customDeltaTime) - view_xview[0];

if (abs(lerpValue) > abs(objPlayer.horizontalSpeed) + 1) {
    lerpValue = (abs(objPlayer.horizontalSpeed) + 1) * sign(lerpValue) * customDeltaTime;
}

view_xview[0] += lerpValue;

// Y axis
if (offsetVertically) {
    yOffset = lerp(yOffset, yOffsetMax, 0.01 * customDeltaTime);
} else {
    yOffset = lerp(yOffset, 0, 0.1 * customDeltaTime);
}

view_yview[0] = lerp(view_yview[0], (objPlayer.y - 0.5 * view_hview[0]) + yOffset * view_hview[0], 0.05 + 0.05 * abs(objPlayer.verticalSpeed) * customDeltaTime);
view_yview[0] = min(view_yview[0], room_height - view_hview[0] / 1.5);

