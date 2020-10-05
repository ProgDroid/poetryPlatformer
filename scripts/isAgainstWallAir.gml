///@description Check if against a wall in the air (tighter check)
///@arg Facing Direction

if (argument_count < 1) {
    addConsoleMessage("warning", "Bad argument count on isAgainstWall: " + string(argument_count));
    exit;
}

if (argument[0] > 0) {
    var instance    = collision_line(bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, objPlatforms, true, true);
    var oldInstance = collision_line(bbox_right, bbox_top, bbox_right, bbox_bottom, objPlatforms, true, true);
} else if (argument[0] < 0) {
    var instance    = collision_line(bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, objPlatforms, true, true);
    var oldInstance = collision_line(bbox_left, bbox_top, bbox_left, bbox_bottom, objPlatforms, true, true);
}

return instance != noone && oldInstance == noone;

