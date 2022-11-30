if state = states.drop {
	event_inherited();
} else if state = states.wait {
	hsp = 0; vsp = 0;
	rot = 0;
	arc = can_arc;
} else if state = states.hold {
	rot = 1;
	image_xscale = dad.image_xscale
	x = dad.x+dad.weapon_xoffset*image_xscale; 
	y = dad.y-dad.weapon_yoffset;
} else if state = states.toss {
	if arc  vsp += grav;
	scr_move_bounce(hsp,vsp,"solid");
	if can_rotate {
		rot += 5*-image_xscale;
	}
}
