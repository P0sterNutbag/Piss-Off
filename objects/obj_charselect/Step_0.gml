for (var i=0; i<4; i++) {
	if gamepad_button_check_pressed(i,gp_start) {
		var obj = asset_get_index("obj_player"+string(i+1));
		if !instance_exists(obj) {
			with obj_player_emitter {
				if my_player == obj { 
					var emitter = id;
					image_index = 1;
				}
				if my_player == obj_player1 {
					with obj_goto_levelselect  visible = true;
				}
			}
			instance_create_layer(emitter.x,emitter.y,"player",obj_player1);
		}
	}
}

// just for testing //
if keyboard_check_pressed(vk_enter) {
	if !instance_exists(obj_player1) {
			obj = obj_player1;
			with obj_player_emitter {
				if my_player == obj { 
					var emitter = id;
					image_index = 1;
				}
				if my_player == obj_player1 {
					with obj_goto_levelselect  visible = true;
				}
			}
			instance_create_layer(emitter.x,emitter.y,"player",obj_player1);
		}
}


//random_range(obj_camera.xpos+30,obj_camera.xpos+obj_camera.base_width-30);