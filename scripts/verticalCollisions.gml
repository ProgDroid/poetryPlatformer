///@description Vertical collisions

offsetBottom = bbox_bottom - y;

originalBboxBottom = bbox_bottom;

y += verticalSpeed * customDeltaTime;

if (place_meeting(x, y, objFloors)) {
    var wall = instance_place(x, y, objFloors);
    
    if (verticalSpeed > 0) {
        y = wall.bbox_top - 1 - offsetBottom;
        verticalSpeed = 0;
    }
} else if (place_meeting(x, y, objPlatforms)) {
    var wall = instance_place(x, y, objPlatforms);

    if (originalBboxBottom >= wall.bbox_top) {
        exit;
    }
    
    if (verticalSpeed > 0) {
        y = wall.bbox_top - 1 - offsetBottom;
        verticalSpeed = 0;
    }
}

