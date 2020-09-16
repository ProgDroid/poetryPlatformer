///@description Check if is against a wall
///@arg facingDirection (-1 for left and 1 for right)

if (argument_count < 1) {
    addConsoleMessage("warning", "Bad argument count on isAgainstWall: " + string(argument_count));
}

var instance = instance_place(x + argument[0], y, objFloors);

if (instance != noone) {
    var bboxSelf     = 0;
    var bboxInstance = 0;
    
    if (facingDir == -1) {
        bboxSelf     = bbox_left;
        bboxInstance = instance.bbox_right;
    } else if (facingDir == 1) {
        bboxSelf     = bbox_right;
        bboxInstance = instance.bbox_left;
    }
    
    return bboxSelf + facingDir == bboxInstance;
}

return false;

