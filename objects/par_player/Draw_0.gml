var h = (hp/hp_max)*100;

if flash {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,0,0,0);
} else {
	draw_self();
	draw_set_alpha((100-h)*0.01);
	gpu_set_fog(true,c_yellow,0,0);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,(100-h)*0.01);
	gpu_set_fog(false,0,0,0);
	draw_set_alpha(1);
}

// ammo
if ammo < ammo_max {
	var p = (ammo/ammo_max)*sprite_get_number(spr_pissmeter);
	if canshoot  var c = c_yellow;
	else  c = c_white;
	draw_sprite(spr_pissmeter,p,x,y-23);
	//draw_healthbar(x+5,y-24,x-6,y-23,p,c_black,c,c,1,true,false);
}
var charge = (charge_timer/charge_timer_max)*100;
draw_healthbar(x+5,y-22,x-6,y-22,charge,c_white,c_white,c_white,1,false,false);

//draw_healthbar(x+4,y-23,x-6,y-22.5,h,c_black,c_green,c_green,1,true,false);

// draw icon
//if image_xscale = -1  var o = -1;
//else o = 0;
draw_sprite(my_icon,0,x,y-16);


if draw_arc {
	if my_weapon = noone {
		var xoff = 0;
		var yoff = piss_yoffset
	} else {
		var xoff = weapon_xoffset*image_xscale;
		var yoff = weapon_yoffset;
	}
	parabolax[0] = x+xoff;
	parabolay[0] = y-yoff;
	if my_weapon = noone {
		if charge_timer < charge_timer_max  var spd = piss_spd;
		else  spd = piss_charge_spd;
		var g = grav;
	} else {
		spd = my_weapon.spd;
		if my_weapon.arc  g = my_weapon.grav;
		else g = 0;
	}
	var vspd = lengthdir_y(spd,dir); //you might also be asking about getting these values, which I'd need to test out to help
	var hspd = lengthdir_x(spd,dir);
	var maxsteps = 100;
	for (timer = 1; timer <= maxsteps; timer++) {
		vspd += g;
		parabolax[timer] = parabolax[timer-1] + hspd;
		parabolay[timer] = parabolay[timer-1] + vspd;
		if tile_position_meeting(parabolax[timer],parabolay[timer],"solid") {
			maxsteps = timer;
			break;
		}
	}
	if charge_timer >= charge_timer_max  var step = 1;
	else  step = 2;
	for(i = 0; i < maxsteps; i+=step) {
		var d = point_direction(parabolax[i],parabolay[i],parabolax[i+1],parabolay[i+1])
		draw_sprite_ext(spr_line,0,parabolax[i],parabolay[i],1,1,d,c_white,1);
	}
}
