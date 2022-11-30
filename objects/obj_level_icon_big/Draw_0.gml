/*if !surface_exists(my_surf) {
	room_goto(rm_battle1);
	surf_rm_battle1 = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_copy(surf_rm_battle1,0,0,application_surface);
	room_goto(room_org);
	my_surf = surf_rm_battle1;
}*/

if my_surf {
	draw_surface_ext(my_surf,x,y,0.075,0.075,0,c_white,1);
}