if bounces > 0 {
	vsp += grav;
	scr_move_collide(hsp,vsp,"solid");
	if tile_meeting(x,y+vsp,"solid") or place_meeting(x,y+vsp,par_solid) {
		vsp = -bounce_spd*bounces;
		bounces--;
	}
}
