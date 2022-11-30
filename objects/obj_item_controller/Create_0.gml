drop_timer_max = 800;
drop_timer_min = 700;
//alarm[0] = random_range(drop_timer_min,drop_timer_max);

emitter_list = ds_list_create();
collision_rectangle_list(0,0,room_width,room_height,obj_item_emitter,false,false,emitter_list,false);

item_list = ds_list_create();
//ds_list_add(item_list,obj_hpdrop);
ds_list_add(item_list,obj_beverage);
