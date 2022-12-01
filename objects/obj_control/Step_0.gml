//if keyboard_check_pressed(ord("R"))  game_restart();
//if keyboard_check_pressed(vk_escape)  game_end();

var col = make_color_hsv(hue,175,255);
var back = layer_background_get_id("Background");
//layer_background_blend(back,col);

/*for (var i=0; i<ds_list_size(global.players_list); i++) {
	if gamepad_button_check_pressed(i,gp_shoulderrb) or keyboard_check_pressed(ord("Y")) {
		hue = random_range(150,255);
	}
}*/

//hue += 0.1;
// sort list
/*if ds_list_size(global.players_list) > 1 {
	//ds_list_sort(global.players_list,true);
}*/

// slow mo for victory
var n=0;
if !global.game_over {
	if instance_number(par_player) > 1 {
		with par_player {
			if life > 0 {
				n++;
				global.winner = id;
			}
		}
		if n <= 1 {
			game_set_speed(5,gamespeed_fps);
			global.game_over = true;
			slowmo = true;
			alarm[1] = game_get_speed(gamespeed_fps);
			alarm[2] = 300;
			global.player_wins[? global.winner.object_index]++;
		}
	}
}
if global.game_over and !slowmo and game_get_speed(gamespeed_fps) < 60 {
	game_set_speed(lerp(game_get_speed(gamespeed_fps),60,0.025),gamespeed_fps);
}
