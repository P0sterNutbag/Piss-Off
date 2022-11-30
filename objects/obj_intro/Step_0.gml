if phase < phase_max {
	if fade_in = true {
		if image_alpha < 1 {
			image_alpha += alpha_change;
		} else {
			if alarm[0] = -1  alarm[0] = 90;
		} 
	} else {
		if image_alpha > 0 {
			image_alpha -= alpha_change;
		} else {
			if alarm[0] = -1  alarm[0] = 20;
		} 
	}
} else {
	instance_create_layer(0,0,"control",obj_title);
	instance_destroy();
}

if background_scale > background_scale_targ {
	background_scale -= background_scale_rate;
}
if background_alpha < 1  background_alpha+=0.00025;

for (var i=0; i<gamepad_get_device_count(); i++) {
	if gamepad_button_check_pressed(i,gp_start) or gamepad_button_check_pressed(i,gp_face1) {
		instance_create_layer(0,0,"control",obj_title);
		instance_destroy();
	}
}

if keyboard_check_pressed(vk_enter) {
	instance_create_layer(0,0,"control",obj_title);
	instance_destroy()
}
