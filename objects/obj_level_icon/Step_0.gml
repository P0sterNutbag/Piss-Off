var piss_collisions = ds_list_create();
var piss_amount = collision_rectangle_list(bbox_right,bbox_bottom,bbox_left,bbox_top,par_piss,false,false,piss_collisions,false);
if piss_amount > 0 {
	for (var i=0; i<piss_amount; i++) {
		var piss = piss_collisions[| i];
		// damage
		hp -= piss.dmg;
		// particals
		if !place_meeting(x,y,obj_partical) {
			var partical = instance_create_layer(piss.x,piss.y,"particals",obj_partical)
			with partical {
				sprite_index = spr_hit;
				image_angle = piss.image_angle;
			}
		}
		with piss  instance_destroy();
	}
} else {
	if hp < hp_max {
		hp += 1;
	} else {
		hp = hp_max;
	}
}


if hp <= 0 {
	room_goto(my_room);
}
