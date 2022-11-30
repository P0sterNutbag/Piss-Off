var push = max(0,gamepad_button_check(0,gp_face2),keyboard_check(vk_enter));
var release = max(0,gamepad_button_check_released(0,gp_face2),keyboard_check_released(vk_enter));

if visible and ready {
	if push {
		if ready_timer > 0 {
			ready_timer--;
		} else {
			collision_rectangle_list(0,0,room_width,room_height,par_player,false,false,global.players_list,false);
			for (var i=0; i<ds_list_size(global.players_list); i++) {
				global.players_list[| i] = global.players_list[| i].object_index;
			}
			room_goto(rm_levelselect);
		}
	} else {
		ready_timer = ready_timer_max;
	}
}

if release  ready = true;
