///@description check if it's on floor
///@args type of object (optional)

var object = objBottoms;

if (argument_count == 1) {
    object = argument[0];
}

var instance = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, object, true, true);

if (instance != noone) {
    var returnValue = lines_intersect(
        x, y, x, bbox_bottom + 1, // from player centre to right below
        instance.lineX1, instance.lineY1, instance.lineX2, instance.lineY2, // platform top line
        false
    );

    return (0 < returnValue && returnValue <= 1);
}

return false;

