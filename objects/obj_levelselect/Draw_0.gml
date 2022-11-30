var len = array_length(levels);
for (var i=0; i<len; i++) {
	var spr = asset_get_index("spr_"+room_get_name(levels[i])+"_icon");
	var xx = (x-total_length/2)+(icon_width+icon_space_x)*i;
	var yy = y;
	draw_sprite(spr,0,xx,yy);
	if i == level_index {
		draw_sprite(spr_icon_slector,0,xx,yy);
	}
}
