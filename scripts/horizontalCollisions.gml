///@description Horizontal collisions

x += horizontalSpeed * customDeltaTime;

if (place_meeting(x, y, objFloors)) {
    var wall = instance_place(x, y, objFloors);
    
    if (horizontalSpeed > 0) {
        x = wall.bbox_left - 1 - offsetRight;
    } else if (horizontalSpeed < 0) {
        x = wall.bbox_right + 1 - offsetLeft;
    }
    
    horizontalSpeed = 0;
}

