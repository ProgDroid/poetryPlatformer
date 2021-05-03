var instance = instance_create(objPlayer.x - 1, objPlayer.y, objParticles);

instance.sprite_index = landingSplat;
instance.image_speed  = IMAGESPEED;
instance.image_alpha  = 1;
instance.image_xscale = 0.25 * PLATFORMSCALE;
instance.image_yscale = 0.25 * PLATFORMSCALE;
instance.maxIndex     = 8;
instance.fade         = true;

instance = instance_create(objPlayer.x - 2, objPlayer.y, objParticles);

instance.sprite_index = landingSplatGrey;
instance.image_speed  = IMAGESPEED;
instance.image_alpha  = 1;
instance.image_xscale = 0.25 * PLATFORMSCALE;
instance.image_yscale = 0.25 * PLATFORMSCALE;
instance.maxIndex     = 8;
instance.fade         = true;

