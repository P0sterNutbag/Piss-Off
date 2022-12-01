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
		/* sort players
		if ds_list_size(global.stages) == 2 {
			ds_list_set(global.stages,0,obj_player1);
			ds_list_set(global.stages,1,obj_player2);
		} else if ds_list_size(global.stages) == 3 {
			ds_list_set(global.stages,0,obj_player1);
			ds_list_set(global.stages,1,obj_player2);
			ds_list_set(global.stages,2,obj_player3);
		} else if ds_list_size(global.stages) == 3 {
			ds_list_set(global.stages,0,obj_player1);
			ds_list_set(global.stages,1,obj_player2);
			ds_list_set(global.stages,2,obj_player3);
			ds_list_set(global.stages,3,obj_player4);
		}*/
		room_goto(stage);
	}
}
