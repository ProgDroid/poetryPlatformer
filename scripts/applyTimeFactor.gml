///@description Apply a change in time factor
///@arg float timeFactor

global.timeFactor = argument[0];

with(objCharacter) {
    image_speed = IMAGESPEED;    
}

with(objCollectible) {
    image_speed = IMAGESPEED;
}

with(objCollectibleLetter) {
    image_speed = IMAGESPEED;
}

