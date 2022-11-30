audio_stop_all();
audio_play_sound(snd_lobby,1,false);

for (var i=0; i<4; i++) {
	var color = choose(make_color_rgb(143+random_range(-10,10),86+random_range(-10,10),59+random_range(-10,10)),make_color_rgb(255,205+random_range(-10,10),178+random_range(-10,10)),make_color_rgb(102+random_range(-10,10),57+random_range(-10,10),49+random_range(-10,10)),make_color_rgb(178+random_range(-10,10),120+random_range(-10,10),107+random_range(-10,10)));
	global.player_colors[i] = color;
}

global.last_room = room;
