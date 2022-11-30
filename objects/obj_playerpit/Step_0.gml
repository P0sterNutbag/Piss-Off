var inst = instance_place(x,y,par_player);
if inst {
	instance_destroy(inst);
	if instance_number(par_player) <= 0 {
		// get stage
		var size = ds_list_size(global.stages)-1;
		var stage = global.stages[| irandom(size)];
		while stage == global.last_room {
			stage = global.stages[| irandom(size)];
		}
		room_goto(stage);
	}
}
