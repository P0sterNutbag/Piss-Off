var vaxis = gamepad_axis_value(my_device,gp_axislv);
var key_down = vaxis > 0.5 and vaxis_last < 0.5;
var key_up = vaxis < -0.5 and vaxis_last > -0.5;
var push = max(0,gamepad_button_check_pressed(my_device,gp_face3),gamepad_button_check_pressed(my_device,gp_face1));

if key_up  ypos--;
if key_down  ypos++;
if ypos < 0  ypos = menu_length-1;
else if ypos > menu_length-1  ypos = 0;

if push {
	if ypos == 0 {
		
	} else if ypos == 1 {
		room_goto(rm_join);
		ds_list_clear(global.players_list);
	} else if ypos == 2 {
		game_end();
	}
	instance_activate_all();
	instance_destroy();
}

if gamepad_button_check_pressed(my_device,gp_start) {
	instance_activate_all();
	instance_destroy();
}

vaxis_last = vaxis;
