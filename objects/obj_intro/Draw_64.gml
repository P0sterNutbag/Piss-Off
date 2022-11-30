var width = display_get_gui_width();
var height = display_get_gui_height();

draw_sprite_ext(spr_title_grayscale,0,width/2,height/2,background_scale,background_scale,0,c_white,background_alpha);

draw_set_font(fnt_txt);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_alpha(image_alpha);
draw_text(width/2,height/2,text[phase]);
draw_set_alpha(1);
