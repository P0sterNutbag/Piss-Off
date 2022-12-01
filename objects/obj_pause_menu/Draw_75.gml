draw_set_color(c_black);
draw_rectangle(0,0,gui_width,gui_height,false);

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_txt);
draw_set_color(c_white);

// draw text
for (var i=0; i<menu_length; i++) {
	draw_text(xorg+text_xoffset,yorg+space*i,menu_items[i]);
	// draw selector
	if ypos == i {
		draw_sprite_ext(spr_arrow,0,xorg+arrow_xoffset,yorg+1+space*i,1,1,0,c_white,1);
	}
}
