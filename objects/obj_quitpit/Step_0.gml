var inst = instance_place(x,y,par_player);
if inst {
	instance_destroy(inst);
	ds_list_delete(global.players_list,inst.object_index);
	if instance_number(par_player) <= 0 {
		room_goto(rm_main_menu);
	}
}
