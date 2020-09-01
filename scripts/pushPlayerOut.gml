///pushPlayerOut(instance)

if (abs(x - argument[0].bbox_left) < abs(x - argument[0].bbox_right)) {
    xDir = 180;
} else {
    xDir = 0;
}

move_outside_all(xDir, 0);


if (abs(y - argument[0].bbox_top) < abs(y - argument[0].bbox_bottom)) {
    yDir = 90;
} else {
    yDir = 270;
}

move_outside_all(yDir, 0);

