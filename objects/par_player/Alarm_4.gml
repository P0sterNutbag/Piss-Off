repeat(3) {
	ammo-=4;
	ammo_refill_timer = ammo_refill_timer_max;
	with instance_create_layer(x,y-piss_yoffset,"projectiles",my_piss) {
		var d = other.dir+random_range(-1,1);
		hsp = lengthdir_x(other.piss_charge_spd,d);
		vsp = lengthdir_y(other.piss_charge_spd,d);
		image_angle = d;
		image_xscale = 5;
		dmg *= other.charge_dmg_mult
	}
}
if charge_repeat > 0 {
	charge_repeat--;
	alarm[4] = 1
} else {
	charge_repeat = charge_repeat_max;
}
