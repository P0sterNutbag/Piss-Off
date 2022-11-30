if instance_exists(my_player) {
	var push = max(0,gamepad_button_check(my_player.my_device,gp_face2),keyboard_check(vk_backspace));
	if push {
		instance_destroy(my_player);
		sprite_index = spr_join;
		with obj_goto_levelselect  visible = false;
	}
} else {
	if gamepad_button_check_pressed(my_device,gp_start) {
		var inst = instance_create_layer(x,y,"player",my_player);
		ds_list_add(global.players_list,inst.object_index);
		sprite_index = noone;
		if instance_exists(obj_start)  obj_start.visible = true;
	}
	if keyboard_check_pressed(vk_enter) and (my_player = obj_player1 or my_player = obj_player2) {
		var inst = instance_create_layer(x,y,"player",my_player);
		ds_list_add(global.players_list,inst.object_index);
		sprite_index = noone;
		if instance_exists(obj_start)  obj_start.visible = true;
	}
}
