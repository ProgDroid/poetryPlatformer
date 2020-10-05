///@description Check if sliding off from platforms

var instance = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, objPlatforms, true, true);

return instance != noone;

