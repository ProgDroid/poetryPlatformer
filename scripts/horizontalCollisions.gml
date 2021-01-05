///@description Horizontal collisions

var originalBboxLeft  = bbox_left;
var originalBboxRight = bbox_right;

var oldX = x;
var oldY = y;

x += horizontalSpeed * customDeltaTime;

if (state_name == "walk" && !isOnFloor()) {
    var previousY = y;
    var previousX = x;

    var angle     = 1;
    var maxSpeed  = maxHorizontalSpeed - (exp((maxHp - hp) / maxHp) - 1) * 0.5;

    while(!isOnFloor()) {
        x = oldX + lengthdir_x(horizontalSpeed * customDeltaTime, angle);
        y = oldY + lengthdir_y(horizontalSpeed * customDeltaTime, angle);
        if (!isOnFloor()) {
            x = oldX + lengthdir_x(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
            y = oldY + lengthdir_y(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
        }
        if (angle >= sweepUpAngleCheck) {
            x = previousX;
            y = previousY;
            break;
        }
        angle += 1;
    }

    angle = -1;
    if (x == previousX && y == previousY) {
        while(!isOnFloor()) {
            x = oldX + lengthdir_x(horizontalSpeed * customDeltaTime, angle);
            y = oldY + lengthdir_y(horizontalSpeed * customDeltaTime, angle);
            if (!isOnFloor()) {
                x = oldX + lengthdir_x(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
                y = oldY + lengthdir_y(maxSpeed * sign(horizontalSpeed) * customDeltaTime, angle);
            }
            if (angle <= -sweepDownAngleCheck) {
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
    instance = collision_line(bbox_right + 1, bbox_top, bbox_right + 1, y, objPlatforms, true, true);
} else if (horizontalSpeed < 0) {
    instance = collision_line(bbox_left - 1, bbox_top, bbox_left - 1, y, objPlatforms, true, true);
}

//if (noCollision && instance != noone) {
//    exit;
//} else if (noCollision && instance == noone) {
//    noCollision = false;
//}

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

