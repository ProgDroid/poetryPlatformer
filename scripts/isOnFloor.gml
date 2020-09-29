///@description check if it's on floor
///@args type of object (optional)

var object = objBottoms;

if (argument_count == 1) {
    object = argument[0];
}


var rightAboveInstance = collision_line(x, y, x, bbox_bottom, objPlatforms, true, true);

var instance           = collision_line(x, y, x, bbox_bottom + 1, objPlatforms, true, true);

return instance != noone && rightAboveInstance == noone;

