///@description Vertical collisions

var originalBboxTop    = bbox_top;
var originalBboxBottom = bbox_bottom;

y += verticalSpeed * customDeltaTime;

var instanceAbove = collision_line(bbox_left, bbox_top - 1, bbox_right, bbox_top - 1, objPlatforms, true, true);
var instance      = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, objPlatforms, true, true);

//if (noCollision && instance != noone) {
//    exit;
//} else if (noCollision && instance == noone) {
//    noCollision = false;
//}

if (instance != noone ^^ instanceAbove != noone) {
    if (verticalSpeed <= 0 && instanceAbove != noone) {
        var previousX = x;
        var previousY = y;
        
        if (!place_meeting(x + 1, y - 1, objPlatforms)) {
            x = x + 1;
        }
        
        if (x == previousX) {
            if (!place_meeting(x - 1, y - 1, objPlatforms)) {
                x = x - 1;
            }
        }
        
        if (x == previousX) {
            move_outside_all(270, min(abs(offsetTop), (abs(bbox_top - originalBboxTop))));
            verticalSpeed = 0;
        }
    }

    if (verticalSpeed > 0 && instance != noone) {
        move_outside_all(90, min(offsetBottom, (abs(bbox_bottom - originalBboxBottom))));
        verticalSpeed = 0;
        eventFire(allEvents.landedon, instance);
        
        drawingScaleX = 1.25;
        drawingScaleY = 0.8;
        image_speed   = 0;
        
        if (!isOnFloor(objPlatforms) || !isSlidingOff(objPlatforms)) {
            var toMove      = collision_line_first(x, y, x, bbox_bottom + offsetBottom, objPlatforms, true, true);

            if (toMove[0] != noone) {
                y += toMove[2] - bbox_bottom;        
            }
        }
    }
}

