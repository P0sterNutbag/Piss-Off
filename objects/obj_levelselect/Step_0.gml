var haxis = gamepad_axis_value(0,gp_axislh);
var push = max(0,gamepad_button_check_pressed(0,gp_face1),gamepad_button_check_pressed(0,gp_start));
var back = gamepad_button_check_pressed(0,gp_face2);
var len = array_length(levels);

// move cursor
if can_move {
	if abs(haxis) > 0.5 {
		level_index += sign(haxis);
		if level_index > len-1  level_index = 0;
		else if level_index < 0  level_index = len-1;
		can_move = false;
	}
} else {
	if abs(haxis) < 0.5 {
		can_move = true;
	}
}

// select level
if push {
	room_goto(levels[level_index]);
}

// go back
if back {
	room_goto(rm_selectchar);
}
