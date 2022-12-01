var s = ds_list_size(global.players_list);
for (var i=0; i < s; i++) {
	var xx = 20+65*i//+((4-s)*50);
	var yy = height-18;
	var player = global.players_list[| i]
	if instance_exists(player) {
		draw_sprite(spr_player_hud,player.my_device,xx,yy);
		for(var p=0; p < player.life; p++) {
			draw_sprite(spr_heart,0,xx+sprite_get_width(spr_player_hud)+(sprite_get_width(spr_heart)+2)*p+2,yy);
		}
	}
}

if draw_confetti {
	draw_set_halign(fa_center);
	draw_set_font(fnt_win);
	draw_text(width/2,height-75,"WINNER!!!");
}
