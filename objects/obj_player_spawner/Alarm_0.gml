for (var i=0; i<ds_list_size(global.players_list); i++) {
	if my_player == global.players_list[| i] {
		instance_create_layer(x,y,"player",my_player);
	}
}
