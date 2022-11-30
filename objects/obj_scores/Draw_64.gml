var s = ds_list_size(global.players_list);
for (var i=0; i < s; i++) {
	var xx = 35+100*i+((4-s)*50);
	var yy = 38;
	draw_sprite(spr_player_hud,i,xx,yy);
	var player = global.players_list[| i]
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_txt);
	draw_set_color(c_white);
	//if instance_exists(player) {
		draw_text(xx,yy+10,"WINS:"+string(global.player_wins[? player]));
		draw_text(xx,yy+20,"KILLS:"+string(global.player_kills[? player]));
	//}
}
