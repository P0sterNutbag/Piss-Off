if phase < array_length(text)-1  phase++;
else {
	with par_player {
		state = states.walk;
	}
	instance_destroy();
}

alarm[0] = 60;
