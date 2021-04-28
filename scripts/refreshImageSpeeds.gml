///@description Refresh image speeds for all objects

with(objCharacter) {
    image_speed = IMAGESPEED;
}

with(objCollectible) {
    image_speed = IMAGESPEED;
}

with(objCollectibleLetter) {
    image_speed = IMAGESPEED;
}

with(objParticles) {
    image_speed = IMAGESPEED;
    if (sprite_index == doubleJumpBrush) {
        image_speed = IMAGESPEED * 6;
    }
}

with(objLevelEnd) {
    image_speed = IMAGESPEED;
}

