var instance = instance_create(objPlayer.x, objPlayer.y, objParticles);

instance.alarm[0] = room_speed * customDeltaTime;
object_set_sprite(objParticles, landingSplat);
instance.image_xscale = 0.25 * PLAYERSCALE;
instance.image_yscale = 0.25 * PLAYERSCALE;

