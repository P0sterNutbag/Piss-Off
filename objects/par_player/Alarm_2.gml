if life > 0 {
	visible = true;
	state = states.walk;
	hp = hp_max;
	ammo = ammo_max;
	x = obj_camera.x+random_range(75,250);
	y = obj_camera.y+8;
} else {
	instance_destroy();	
}
