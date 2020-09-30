///@description Check if is against a wall
///@arg facingDirection (-1 for left and 1 for right)

if (argument_count < 1) {
    addConsoleMessage("warning", "Bad argument count on isAgainstWall: " + string(argument_count));
}

if (argument[0] > 0) {
    var instance    = collision_line(bbox_right + 1, bbox_top + 4, bbox_right + 1, bbox_bottom - 4, objPlatforms, true, true);
    var oldInstance = collision_line(bbox_right, bbox_top + 4, bbox_right, bbox_bottom - 4, objPlatforms, true, true);
} else if (argument[0] < 0) {
    var instance    = collision_line(bbox_left - 1, bbox_top + 4, bbox_left - 1, bbox_bottom - 4, objPlatforms, true, true);
    var oldInstance = collision_line(bbox_left, bbox_top + 4, bbox_left, bbox_bottom - 4, objPlatforms, true, true);
} else if (argument[0] == 0) {
    return false;
}

return instance != noone && instance == noone;

