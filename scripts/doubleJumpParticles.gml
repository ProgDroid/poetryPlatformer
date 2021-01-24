var instance = instance_create(objPlayer.x, objPlayer.y, objParticles);

instance.alarm[0]     = room_speed;
instance.sprite_index = doubleJumpBrush;
instance.image_speed  = IMAGESPEED * 6;
instance.image_alpha  = 1;
instance.image_xscale = 0.25;
instance.image_yscale = 0.25;
instance.maxIndex     = 38;
instance.fade         = false;

