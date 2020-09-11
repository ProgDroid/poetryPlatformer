///@description check if it's on floor
///@args type of object (optional)

var object = objBottoms;

if (argument_count == 1) {
    object = argument[0];
}

var instance = instance_place(x, y + 1, object);

if (instance != noone) {
    return bbox_bottom + 1 == instance.bbox_top;
}

return false;

