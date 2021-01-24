///@description Horizontal collisions

var originalBboxLeft  = bbox_left;
var originalBboxRight = bbox_right;

var oldX = x;
var oldY = y;

x += horizontalSpeed * timeFactorController.timeFactor;

if (state_name == "walk" && !isOnFloor()) {
    var previousY = y;
    var previousX = x;
    var maxi      = sweepUpAngleCheck + sweepDownAngleCheck - 1;
    var mini      = 0;
    var mid;

    while (mini <= maxi) {        
        mid = mini + (maxi - mini) div 2;
        x   = oldX + lengthdir_x(horizontalSpeed * timeFactorController.timeFactor, mid - sweepDownAngleCheck);
        y   = oldY + lengthdir_y(horizontalSpeed * timeFactorController.timeFactor * sign(horizontalSpeed), mid - sweepDownAngleCheck);
        
        if (!isOnFloor()) {
            if (place_meeting(x, y, objPlatforms)) {
                mini = mid + 1;
            } else {
                maxi = mid - 1;
            }
            continue;
        }
        break;
    }
}

var instance = noone;

if (horizontalSpeed > 0) {
    instance = collision_line(bbox_right + 1, bbox_top, bbox_right + 1, y, objPlatforms, true, true);
} else if (horizontalSpeed < 0) {
    instance = collision_line(bbox_left - 1, bbox_top, bbox_left - 1, y, objPlatforms, true, true);
}

if (instance != noone && instance.visible) {
    if (horizontalSpeed > 0) {
        move_outside_all(180, min(offsetRight, (abs(bbox_right - originalBboxRight))));
        if (x < oldX) {
            x = oldX;
            //push? or wall slide
            //exit;
        }
    } else if (horizontalSpeed < 0) {
        move_outside_all(0, min(abs(offsetLeft), (abs(bbox_left - originalBboxLeft))));
        if (x > oldX) {
            x = oldX;
            //push? or wall slide
            //exit;
        }
    }
    
    horizontalSpeed = 0;
}

