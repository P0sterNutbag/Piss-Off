event_inherited();

var inst = instance_place(x,y,par_player);
if inst and inst.hp < inst.hp_max and inst.hp > 0 {
	inst.hp +=hp;
	inst.hp = clamp(inst.hp,0,inst.hp_max);
	instance_destroy();
}
