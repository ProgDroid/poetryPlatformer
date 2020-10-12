///@description Update the camera

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

view_yview[0] = lerp(view_yview[0], objPlayer.y - 0.5 * view_hview[0], 0.05 + 0.05 * abs(objPlayer.verticalSpeed) * customDeltaTime);

