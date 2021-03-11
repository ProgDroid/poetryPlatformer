///slideOnWall

if (place_meeting(x, y, objPlatforms)) {
    if (!place_meeting(x - abs(offsetRight), y, objPlatforms)) {
        x -= 1;
    } else if (!place_meeting(x + abs(offsetLeft), y, objPlatforms)) {
        x += 1;
    }
}

