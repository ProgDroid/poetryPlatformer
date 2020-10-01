///@description check if it's on floor

var rightAboveInstance = collision_line(x, y, x, bbox_bottom, objPlatforms, true, true);

var instance           = collision_line(x, y, x, bbox_bottom + offsetBottom / 4 + 1, objPlatforms, true, true);

return instance != noone && rightAboveInstance == noone;

