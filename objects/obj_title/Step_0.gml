for (var i=0; i<gamepad_get_device_count(); i++) {
	if gamepad_button_check_pressed(i,gp_start) or keyboard_check_pressed(vk_enter) {
		room_goto(rm_join);
	}
}

if keyboard_check_pressed(vk_enter)
	room_goto(rm_join);