xorg = 20;
yorg = 20;
space = 15;
text_xoffset = 7;
text_yoffset = 3;
arrow_xoffset = 0;
ypos = 0;
vaxis_last = 0;

menu_items[0] = "RESUME";
menu_items[1] = "NEW GAME";
menu_items[2] = "QUIT";
menu_length = array_length(menu_items);

instance_deactivate_all(true);

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
