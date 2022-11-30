var size = ds_list_size(emitter_list)-1;
var size2 = ds_list_size(item_list)-1;

var emitter = emitter_list[| irandom(size)]//ds_list_find_value(emitter_list,irandom(size));
var item = item_list[| irandom(size2)]
instance_create_layer(emitter.x,emitter.y,"items",item);

alarm[0] = random_range(drop_timer_min,drop_timer_max);
