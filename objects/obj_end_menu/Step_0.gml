var vaxis = gamepad_axis_value(0,gp_axislv);
var key_down = vaxis > 0.5 and vaxis_last < 0.5;
var key_up = vaxis < -0.5 and vaxis_last > -0.5;
var push = max(0,gamepad_button_check(0,gp_start),gamepad_button_check(0,gp_face1));

if key_up  ypos--;
if key_down  ypos++;
if ypos < 0  ypos = menu_length-1;
else if ypos > menu_length-1  ypos = 0;

if push {
	if ypos == 0 {
		room_goto(room_last);
	} else if ypos == 1 {
		room_goto(rm_join);
	} else if ypos == 2 {
		game_end();
	}
	instance_destroy();
}

vaxis_last = vaxis;
