function createBullet( xx, yy, dir, spd, homeIn) {
	if (ds_stack_empty(global.bulletPool)) {
		var bullet = instance_create_layer( xx, yy, "Instances", oBullet);
		with (bullet) {
			direction = dir;
			speed = spd;
			homing = homeIn;
		}
	} else {
		var bullet = ds_stack_pop(global.bulletPool);
		instance_activate_object(bullet);
		with (bullet) {
			x = xx;
			y = yy;
			direction = dir;
			speed = spd;
			homing = homeIn;
		}
	}
}