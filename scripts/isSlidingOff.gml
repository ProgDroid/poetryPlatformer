///@description Check if sliding off from platforms
///@args type of object (optional)

var object = objBottoms;

if (argument_count == 1) {
    object = argument[0];
}

var instance = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, object, true, true);

return instance != noone;

