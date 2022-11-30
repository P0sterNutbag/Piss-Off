//spr_rm_battle1 = sprite_create_from_surface(application_surface,0,0,obj_camera.width,obj_camera.height,false,false,0,0);
surf_rm_battle1 = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
surface_copy(surf_rm_battle1,0,0,application_surface);
room_goto(room_org);
my_surf = surf_rm_battle1;
