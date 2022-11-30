levels[0] = rm_battle1;
levels[1] = rm_battle1;
levels[2] = rm_battle1;
var len = array_length(levels);

level_index = 0;
can_move = true;

icon_width = sprite_get_width(spr_rm_battle1_icon);
icon_height = sprite_get_height(spr_rm_battle1_icon);

icon_space_x = 4;
icon_space_y = 2;

total_length = icon_width*len+icon_space_x*len;
