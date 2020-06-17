///pushPlayerOut

if (abs(x - instance.bbox_left) < abs(x - instance.bbox_right)) {
    xDir = 180;
} else {
    xDir = 0;
}

if (abs(y - instance.bbox_top) < abs(y - instance.bbox_bottom)) {
    yDir = 90;
} else {
    yDir = 270;
}

move_outside_all(xDir, 0);
move_outside_all(yDir, 0); 

