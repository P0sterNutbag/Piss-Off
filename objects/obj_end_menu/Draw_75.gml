draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_txt);

// draw text
for (var i=0; i<menu_length; i++) {
	draw_text(x+text_xoffset,y+space*i,menu_items[i]);
	// draw selector
	if ypos == i {
		draw_sprite_ext(spr_arrow,0,x+arrow_xoffset,y+1+space*i,1,1,0,c_white,1);
	}
}
