event_inherited();

var inst = instance_place(x,y,par_player);
if inst and inst.ammo < inst.ammo_max {
	inst.ammo += ammo;
	inst.ammo = clamp(inst.ammo,0,inst.ammo_max);
	instance_destroy();
}
