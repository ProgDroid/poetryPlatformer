if (speedFactor < 1) {
    speedFactor += 0.01 * customDeltaTime;
}

move_towards_point(objPlayer.x, objPlayer.y, speedFactor * 20 * customDeltaTime);

if (point_distance(x, y, objPlayer.x, objPlayer.y) < 10) {
    speed = 0;
    stateSwitch("dead");
}

