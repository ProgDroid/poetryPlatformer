///@description Vertical collisions

var originalBboxBottom = bbox_bottom;

var oldY = y;

var oldInstance = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, objPlatforms, true, true);

y += verticalSpeed * customDeltaTime;

var instance = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, objPlatforms, true, true);

if (noCollision && instance != noone) {
    exit;
} else if (noCollision && instance == noone) {
    noCollision = false;
}

if (place_meeting(x, y, objFloors)) {
    var wall = instance_place(x, y, objFloors);
    
    if (verticalSpeed > 0) {
        y = wall.bbox_top - 1 - offsetBottom;
        verticalSpeed = 0;
    }
} else if (instance != noone && (oldInstance == noone || oldInstance != instance)) {
    if (verticalSpeed > 0) {
        move_outside_all(90, min(offsetBottom, (abs(bbox_bottom - originalBboxBottom))));
        if (y >= oldY) {
            verticalSpeed = 0;
            eventFire(allEvents.landedon, instance);
        } else {
            y = oldY;
        }
        var previousY = y;
        var count     = 0;
        while ((!isOnFloor(objPlatforms) || !isSlidingOff(objPlatforms))) {
            y += 0.01;
            count += 1;
            if (count > 100) {
                y = previousY;
                break;
            }
        }
    }
}

