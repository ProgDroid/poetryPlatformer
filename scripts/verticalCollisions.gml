///@description Vertical collisions

var originalBboxBottom = bbox_bottom;

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
} else if (instance != noone) {
    var lineIntersect = lines_intersect(
        x, y, x, bbox_bottom + 1, // from player centre to right below
        instance.lineX1, instance.lineY1, instance.lineX2, instance.lineY2, // platform top line
        false
    );
    
    if (verticalSpeed > 0 && 0 < lineIntersect && lineIntersect <= 1) {
        y = -dtan(instance.image_angle) * x + instance.lineC - offsetBottom;
        
        verticalSpeed = 0;
    }
}

