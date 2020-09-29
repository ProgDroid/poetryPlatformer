///@description Horizontal collisions

var originalBboxLeft  = bbox_left;
var originalBboxRight = bbox_right;

var oldX = x;
var oldY = y;

var oldInstance = noone;

if (horizontalSpeed > 0) {
    oldInstance = collision_line(bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, objPlatforms, true, true);
} else if (horizontalSpeed < 0) {
    oldInstance = collision_line(bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, objPlatforms, true, true);
}

x += horizontalSpeed * customDeltaTime;

if (state_name == "walk" && !isOnFloor(objPlatforms)) {
    var previousY = y;
    var previousX = x;

    var angle     = 1;
    var maxSpeed  = maxHorizontalSpeed - (exp((maxHp - hp) / maxHp) - 1) * 0.5;
    var tmpSpeed  = horizontalSpeed;

    while(!isOnFloor(objPlatforms)) {
        x = oldX + lengthdir_x(horizontalSpeed * customDeltaTime, angle);
        y = oldY + lengthdir_y(horizontalSpeed * customDeltaTime, angle);
        if (!isOnFloor(objPlatforms)) {
            x = oldX + lengthdir_x(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
            y = oldY + lengthdir_y(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
        }
        if (angle >= sweepAngleCheck) {
            x = previousX;
            y = previousY;
            break;
        }
        angle += 1;
    }

    angle = -1;
    if (x == previousX && y == previousY) {
        while(!isOnFloor(objPlatforms)) {
            x = oldX + lengthdir_x(horizontalSpeed * customDeltaTime, angle);
            y = oldY + lengthdir_y(horizontalSpeed * customDeltaTime, angle);
            if (!isOnFloor(objPlatforms)) {
                x = oldX + lengthdir_x(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
                y = oldY + lengthdir_y(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
            }
            if (angle <= -sweepAngleCheck) {
                x = previousX;
                y = previousY;
                break;
            }
            angle -= 1;
        }
    }
}

var instance = noone;

if (horizontalSpeed > 0) {
    instance = collision_line(bbox_right + 1, bbox_top + 4, bbox_right + 1, bbox_bottom - 4, objPlatforms, true, true);
} else if (horizontalSpeed < 0) {
    instance = collision_line(bbox_left - 1, bbox_top + 4, bbox_left - 1, bbox_bottom - 4, objPlatforms, true, true);
}

if (noCollision && instance != noone) {
    exit;
} else if (noCollision && instance == noone) {
    noCollision = false;
}

if (instance != noone && (oldInstance == noone || oldInstance != instance)) {
    if (horizontalSpeed > 0) {
        move_outside_all(180, min(offsetRight, (abs(bbox_right - originalBboxRight))));
        if (x < oldX) {
            x = oldX;
            exit;
        }
    } else if (horizontalSpeed < 0) {
        move_outside_all(0, min(offsetLeft, (abs(bbox_left - originalBboxLeft))));
        if (x > oldX) {
            x = oldX;
            exit;
        }
    }
    
    horizontalSpeed = 0;
}

