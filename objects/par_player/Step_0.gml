#region // controls
//if gamepad_is_connected(my_device) {
	//var key_jump = gamepad_button_check_pressed(my_device,gp_face1);
	var key_jump_down = gamepad_button_check(my_device,gp_face1);
	var key_piss = gamepad_button_check(my_device,gp_shoulderrb);
	var key_piss_release = gamepad_button_check_released(my_device,gp_shoulderrb);
	var key_roll =  gamepad_button_check_pressed(my_device,gp_shoulderlb);
	var key_stop = gamepad_button_check(my_device,gp_shoulderr);
	var key_block = gamepad_button_check(my_device,gp_face4);
	
	gamepad_set_axis_deadzone(my_device, 0.25);
	haxis = gamepad_axis_value(my_device, gp_axislh);
	vaxis = gamepad_axis_value(my_device,gp_axislv);
	var key_jump = -vaxis or gamepad_button_check_pressed(my_device,gp_shoulderl);
	var key_jump_down = -vaxis;
	var key_down = vaxis;
	if abs(haxis) > ra_deadzone  var hdir = sign(haxis);
	else hdir = 0;
	//hdir = haxis;
	var key_block = vaxis;
	haxisr = gamepad_axis_value(my_device, gp_axisrh);
	vaxisr = gamepad_axis_value(my_device,gp_axisrv);
	if haxisr == 0 and vaxisr == 0 {
		if image_xscale = 1  dir = 25;
		else  dir = 155;
	} else {
		var d = point_direction(0,0,haxisr,vaxisr);
		dir += angle_difference(d,dir)*0.25;
	}
	
	var key_duck = vaxis;
	var key_up = -vaxis;
	var key_right = haxis;
//} else {
/*	if object_index == obj_player1 {
		var key_right = keyboard_check(ord("D"));
		var key_left = keyboard_check(ord("A"));
		var key_up = keyboard_check(ord("W"));
		var key_down = keyboard_check(ord("S"));
		var key_right_aim = keyboard_check(ord("J"));
		var key_left_aim = keyboard_check(ord("G"));
		var key_up_aim = keyboard_check(ord("Y"));
		var key_down_aim = keyboard_check(ord("H"));
		var key_jump = keyboard_check_pressed(ord("W"));
		var key_jump_down = keyboard_check(ord("W"));
		key_piss = key_right_aim or key_left_aim or key_up_aim or key_down_aim//keyboard_check(ord("J"));
		var key_roll = key_right or key_right;
		var key_roll_right_release = keyboard_check_released(ord("D"))
		var key_roll_left_release = keyboard_check_released(ord("A"));
		var key_stop = keyboard_check(ord("C"));
		var key_block = keyboard_check(ord("S"));
		var key_duck = keyboard_check(ord("S"));
	} else if object_index == obj_player2 {
		var key_right = keyboard_check(vk_right);
		var key_left = keyboard_check(vk_left);
		var key_up = keyboard_check(vk_up);
		var key_down = keyboard_check(vk_down);
		var key_right_aim = keyboard_check(vk_numpad3);
		var key_left_aim = keyboard_check(vk_numpad1);
		var key_up_aim = keyboard_check(vk_numpad5);
		var key_down_aim = keyboard_check(vk_numpad2);
		var key_jump = keyboard_check_pressed(vk_up);
		var key_jump_down = keyboard_check(vk_up);
		key_piss = key_right_aim or key_left_aim or key_up_aim or key_down_aim//keyboard_check(vk_numpad1);
		var key_roll = keyboard_check_pressed(vk_numpad4);
		var key_roll_right_release = keyboard_check_released(ord("D"))
		var key_roll_left_release = keyboard_check_released(ord("A"));
		var key_stop = keyboard_check(vk_numpad0);
		var key_block = keyboard_check(vk_down);
		var key_duck = keyboard_check(vk_down);
	} else if object_index == obj_player3 {
		var key_right = keyboard_check(vk_right);
		var key_left = keyboard_check(vk_left);
		var key_up = keyboard_check(vk_up);
		var key_down = keyboard_check(vk_down);
		var key_right_aim = keyboard_check(vk_numpad3);
		var key_left_aim = keyboard_check(vk_numpad1);
		var key_up_aim = keyboard_check(vk_numpad5);
		var key_down_aim = keyboard_check(vk_numpad2);
		var key_jump = keyboard_check_pressed(vk_up);
		var key_jump_down = keyboard_check(vk_up);
		key_piss = key_right_aim or key_left_aim or key_up_aim or key_down_aim//keyboard_check(vk_numpad1);
		var key_roll = keyboard_check_pressed(vk_numpad4);
		var key_roll_right_release = keyboard_check_released(ord("D"))
		var key_roll_left_release = keyboard_check_released(ord("A"));
		var key_stop = keyboard_check(vk_numpad0);
		var key_block = keyboard_check(vk_down);
		var key_duck = keyboard_check(vk_down);
	} else if object_index == obj_player4 {
		var key_right = keyboard_check(vk_right);
		var key_left = keyboard_check(vk_left);
		var key_up = keyboard_check(vk_up);
		var key_down = keyboard_check(vk_down);
		var key_right_aim = keyboard_check(vk_numpad3);
		var key_left_aim = keyboard_check(vk_numpad1);
		var key_up_aim = keyboard_check(vk_numpad5);
		var key_down_aim = keyboard_check(vk_numpad2);
		var key_jump = keyboard_check_pressed(vk_up);
		var key_jump_down = keyboard_check(vk_up);
		key_piss = key_right_aim or key_left_aim or key_up_aim or key_down_aim//keyboard_check(vk_numpad1);
		var key_roll = keyboard_check_pressed(vk_numpad4);
		var key_roll_right_release = keyboard_check_released(ord("D"))
		var key_roll_left_release = keyboard_check_released(ord("A"));
		var key_stop = keyboard_check(vk_numpad0);
		var key_block = keyboard_check(vk_down);
		var key_duck = keyboard_check(vk_down);
	}else if object_index == obj_dummy {
		var key_right = 0;
		var key_left = 0;
		var key_jump = 0;
		var key_jump_down = 0;
		key_piss = 0;
		var key_roll = 0;
		var key_stop = 0;
		var key_block = 0;
		var key_stop = 0;
	}
	var hdir = key_right - key_left;
	var d;
	if key_right_aim {
		if key_up_aim  d = 45;
		else if key_down_aim  d = 315;
		else  d = 25;
	} else if key_left_aim {
		if key_up_aim  d = 135;
		else if key_down_aim  d = 215;
		else  d = 155;
	} else if key_up_aim {
		d = 90;
	} else if key_down_aim {
		d = 270
	} else {
		if image_xscale = 1  d = 25;
		else  d = 155;
	}
	dir += angle_difference(d,dir)*0.25;
	// roll double tap
	if key_roll_right_release {
		can_roll_right_timer = can_roll_timer_max;
	}
	if key_roll_left_release {
		can_roll_left_timer = can_roll_timer_max;
	}*/
//}
#endregion

// open pause menu
if gamepad_button_check_pressed(my_device,gp_start) {
	with instance_create_layer(x,y,"control",obj_pause_menu) {
		my_device = other.my_device;
	}
}

//var on_ground = tile_meeting(x,y+1,"solid") or (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_platform,false,false) and vsp >= 0) or collision_line(x,y,x,y+2,obj_slope,false,false);
var on_wall = tile_meeting(x+image_xscale,y,"solid") and abs(haxis) > ra_deadzone;
var stain = instance_place(x+hdir,y+2,obj_peestain);
var on_stain = stain and stain.visible;

switch(state) {
#region // WALK STATE //
case states.walk:
	visible = true;
	// movement
	if on_ground {
		if on_stain {
			if !key_piss and charge_timer == 0 {
				var my_speed = stain_spd;
			} else {
				my_speed = stain_spd/2;
			}
			hsp += hdir*my_speed;
			hsp = clamp(hsp,-max_spd,max_spd);
			if hdir == 0  hsp = lerp(hsp,0,0.05);
		} else {
			if !key_piss and charge_timer == 0  hsp = hdir*spd;
			else  hsp = hdir*piss_walk_spd;
			max_spd = spd;
		}
		if key_jump {
			vsp = -jump_spd;
			boosted = false;
			max_spd = abs(hsp);
		}
		if abs(hsp) < 0.1  max_spd = spd;
	} else {
		// move
		hsp += hdir*air_spd;
		hsp = clamp(hsp,-max_spd,max_spd);
		if tile_meeting(x+hsp,y,"solid")  hsp = 0;
		if abs(hsp) < max_spd  max_spd = abs(hsp); 
		if max_spd < spd  max_spd = spd;
		if key_down  vsp += grav*2;
		vsp = clamp(vsp,-1000,vsp_max);
		if !on_wall  vsp += grav; // fall down
		else { // wall jump
			hsp = 0;
			max_spd = spd;
			if !on_stain {
				vsp = wall_slide_spd;
			} else {
				vsp += wall_slide_spd*0.1;
			}
			if key_jump {
				vsp = -jump_spd;
				boosted = false
				hsp = wall_jump_spd*-sign(image_xscale);
			}
		}
	}
	scr_move_collide(hsp,vsp,"solid");
	
	//dir = point_direction(x,y-piss_yoffset,mouse_x,mouse_y);
	
	// piss
	if key_piss and ammo > 0 and canshoot and can_autofire and my_weapon == noone {
		if charge_timer < charge_timer_max {
			ammo--;
			ammo_refill_timer = ammo_refill_timer_max;
			with instance_create_layer(x,y-piss_yoffset,"projectiles",my_piss) {
				var d = other.dir+random_range(-5,5);
				hsp = lengthdir_x(other.piss_spd,d);
				vsp = lengthdir_y(other.piss_spd,d);
				image_angle = d;
				image_xscale = 2;
			}
		} else {
			alarm[4] = 1;
			can_autofire = false;
		}
		draw_arc = false;
		charge_timer = 0;
	} else if (haxisr != 0 or vaxisr != 0) and can_autofire {
		draw_arc = true;
		if my_weapon = noone  charge_timer++;
	} else {
		draw_arc = false
		charge_timer = 0;
	}
	
	// autofire
	if !can_autofire {
		if !key_piss {
			can_autofire = true;
		}
	}
	
	// roll
	if can_roll_right_timer > 0  can_roll_right_timer--;
	if can_roll_left_timer > 0  can_roll_left_timer--;
	if on_ground or on_wall airdashes = airdashes_max;
	if key_roll {
		if !on_ground  airdashes--;
		state = states.roll;
		vsp = 0;
		charge_timer = 0;
		image_index = 0;
	}
	
	// duck
	if key_duck and on_ground {
		state = states.duck;
	}
	
	// go down a platform
	if place_meeting(x,y+1,obj_platform) and key_jump and key_down {
		y++;
	}
	
	// ladder
	if collision_rectangle(x+2,y,x-2,bbox_top,obj_ladder,false,false) and key_up {
		state = states.ladder;
		airdashes = airdashes_max;
	}
	
	// pick up weapons
	if key_down and place_meeting(x,y,par_weapon) {
		var weapon = instance_place(x,y,par_weapon);
		if weapon.state != states.hold {
			my_weapon = weapon;
			weapon.dad = id;
			weapon.state = states.hold;
		}
	}
	
	// throw weapons
	if my_weapon != noone and key_piss {
		with my_weapon {
			hsp = lengthdir_x(spd,other.dir);
			vsp = lengthdir_y(spd,other.dir);
			state = states.toss;
		}
		can_autofire = false;
		my_weapon = noone;
	}
	
	// animate
	if hdir > 0  image_xscale = 1;
	if hdir < 0  image_xscale = -1;
	if on_ground {
		if hdir != 0 {
			if !key_piss  sprite_index = walk_sprite;
			else  sprite_index = walk_piss_sprite;
		} else if key_piss  sprite_index = piss_sprite;
		else  sprite_index = idle_sprite;
	} else {
		if on_wall  sprite_index = wallslide_sprite;
		else if key_piss  sprite_index = jump_piss_sprite;
		else sprite_index = jump_sprite;
	}
	
	break;
#endregion
#region // ROLL STATE //
case states.roll:
	sprite_index = roll_sprite;
	if image_index >= 3 {
		if on_ground {
			if !on_stain  hsp = lerp(hsp,0,0.1);
			else hsp = lerp(hsp,spd*sign(hsp),0.1);
		} else {
			state = states.walk;
			max_spd = roll_spd;
		}
	} else {
		hsp = image_xscale*roll_spd;
	}
	if key_jump and on_ground {
		y--;
		state = states.walk;
		vsp -= jump_spd;
		max_spd = roll_spd;
	}
	if tile_meeting(x+hsp,y,"solid") and !place_meeting(x,y,obj_slope) {
		state = states.walk;
	}
	scr_move_collide(hsp, vsp, "solid");
	
	// ladder
	if collision_rectangle(x+2,y,x-2,bbox_top,obj_ladder,false,false) and key_up {
		state = states.ladder;
		airdashes = airdashes_max;
	}
	
	// collide with enemies
	var opponent = instance_place(x+hsp,y,par_player);
	if opponent and opponent != id {
		if opponent.state == states.roll {
			state = states.knockback;
			hsp = knockback_hsp*-image_xscale;
			vsp = -knockback_vsp;
			opponent.state = states.knockback;
			opponent.hsp = knockback_hsp*-opponent.image_xscale;
			opponent.vsp = -knockback_vsp;
		} else if opponent.state != states.block and opponent.state != states.stun {
			opponent.state = states.stun;
			opponent.hsp = knockback_hsp*image_xscale;
			opponent.vsp = -knockback_vsp;
			opponent.y--;
			state = states.walk;
		} else {
			state = states.knockback;
			hsp = knockback_hsp*-image_xscale;
			vsp = -knockback_vsp;
		}
	}
	if image_index >= image_number-1 {
		state = states.walk;
		invincible = true
	}
break;
#endregion
#region // STUN STATE //
case states.stun:
	if alarm[0] = -1  alarm[0] = stun_timer;
	if on_ground {
		//hsp = 0; vsp = 0;
		state = states.walk;
	} else {
		vsp += grav;
		image_xscale = -sign(hsp);
	}
	scr_move_collide(hsp,vsp,"solid");
	sprite_index = knockback_sprite;
break;
#endregion
#region // BLOCK STATE //
case states.duck:
	if !key_duck  state = states.walk;
	sprite_index = spr_player_duck;
	if !on_stain  hsp = 0;
	else  hsp = lerp(hsp,0,0.05);
break;
#endregion
#region // KNOCKBACK STATE //
case states.knockback:
	if on_ground {
		state = states.walk;
	} else {
		vsp += grav;
		image_xscale = -sign(hsp);
	}
	scr_move_collide(hsp,vsp,"solid");
	sprite_index = knockback_sprite;
break;
#endregion
#region
case states.die:
	vsp += grav;
	if bounces > 0  var a = 1;
	else  a = 0.5;
	if tile_meeting(x+hsp,y,"solid") {
		hsp = -hsp*a;
		bounces--;
	}
	if tile_meeting(x,y+vsp,"solid") {
		vsp = -vsp*a;
		bounces--;
	}
	
	if bounces < 0 and on_ground {
		vsp = 0;
		hsp = lerp(hsp,0,0.1);
	}	
	scr_move_collide(hsp,vsp,"solid");
	if abs(hsp) < 1 and abs(vsp) < 1 {
		if alarm[1] = -1  alarm[1] = 5;
		if alarm[2] = -1  alarm[2] = 120;
	}
	sprite_index = spr_player_dead;
	image_xscale = -sign(hsp);
break;
#endregion
#region // FAKE DIE
case states.fakedie:
	vsp += grav;
	if bounces > 0  var a = 1;
	else  a = 0.5;
	if tile_meeting(x+hsp,y,"solid") {
		hsp = -hsp*a;
		bounces--;
	}
	if tile_meeting(x,y+vsp,"solid") {
		vsp = -vsp*a;
		bounces--;
	}
	if bounces < 0 and on_ground {
		vsp = 0;
		hsp = lerp(hsp,0,0.1);
	}
	// revive
	if bounces <= 0 {
		state = states.walk;
		hp = hp_max;
	}
	scr_move_collide(hsp,vsp,"solid");
	sprite_index = spr_player_dead;
	image_xscale = -sign(hsp);
break;
#endregion
#region // LADDER //
case states.ladder:
	var inst = instance_place(x,y,obj_ladder);
	if inst {
		x = inst.x;
		hsp = 0;
		if tile_meeting(x,y+1,"solid") {
			state = states.walk;
		}
		if abs(haxis) > ra_deadzone and abs(vaxis) < ra_deadzone {
			state = states.walk
		}
		if key_up {
			vsp = -ladder_spd;
			sprite_index = spr_player_ladder;
		} else if key_down {
			vsp = ladder_spd;
			sprite_index = spr_player_ladder;
		} else {
			vsp = 0;
			sprite_index = spr_player_ladder_idle;
		}
		scr_move_collide(hsp,vsp,"solid");
	} else {
		//if place_meeting(x,y+1,obj_ladder) {
			vsp = -jump_spd;
			boosted = false;
			max_spd = spd;
		//}
		state = states.walk;
	}
break;
#endregion
#region
case states.cutscene:
	if !on_ground  vsp += grav;
	hsp = 0;
	
	scr_move_collide(hsp,vsp,"solid");
	
	if !on_ground  sprite_index = jump_sprite;
	else  sprite_index = idle_sprite;
break;
#endregion
}

// take damage
if hp > 0 and state != states.dead {
	var piss_collisions = ds_list_create();
	var piss_amount = collision_rectangle_list(bbox_right,bbox_bottom,bbox_left,bbox_top,par_piss,false,false,piss_collisions,false);
	if piss_amount > 0 and state != states.roll {
		for (var i=0; i<piss_amount; i++) {
			var piss = piss_collisions[| i];
			if piss.object_index != my_piss {
				// damage
				hp -= piss.dmg;
				hurt_dir = point_direction(piss.xprevious,piss.yprevious,x,y);
				// particals
				if !place_meeting(x,y,obj_partical) {
					var partical = instance_create_layer(piss.x,piss.y,"particals",obj_partical)
					with partical {
						sprite_index = spr_hit;
						image_angle = piss.image_angle;
					}
				}
				if flash  flash = false;
				else {
					flash = true; alarm[3] = 3;
				}
				if hp <= 0 {
					/*scr_create_partical(spr_death_blast);
					if room != rm_join and room != rm_afterbattle {
						with par_player {
							if my_piss == piss.object_index {
								global.player_kills[? object_index]++;
							}
						}
					}*/
				}
				with piss  instance_destroy();
			}
		}
		hp_regen_timer = hp_regen_timer_max;
	} else {
		if hp_regen_timer <= 0 {
			if hp >= hp_max  hp = hp_max;
			else  hp += hp_regen_rate;
		} else {
			hp_regen_timer--;
		}
	}
	ds_list_destroy(piss_collisions);
}

// die
if hp <= 0 and state != states.die {
	if room == rm_join or room == rm_afterbattle {
		state = states.fakedie;
	} else {
		state = states.die;
		life--;
	}
	hsp = lengthdir_x(explode_spd,hurt_dir);
	vsp = lengthdir_y(explode_spd,hurt_dir);
	bounces = 3;
	hp = hp_max;
	
	scr_create_partical(spr_death_blast);
	if room != rm_join and room != rm_afterbattle {
		with par_player {
			if my_piss == piss.object_index {
				global.player_kills[? object_index]++;
			}
		}
	}
}

// boosts 
var boost = instance_place(x,y,obj_boost) 
if boost {
	if boost.object_index = obj_boost and vsp > 0 {
		y = boost.bbox_top;
		vsp = -boost.boost_spd;
		boosted = true;
	} else if boost.object_index = obj_boost_right and hsp != 0{
		hsp = boost.boost_spd*boost.image_xscale;
		boosted = true;
		max_spd = boost.boost_spd;
	} else if boost.object_index = obj_boost_angle and vsp > 0 {
		hsp = lengthdir_x(boost.boost_spd,boost.boost_dir);
		vsp = lengthdir_y(boost.boost_spd,boost.boost_dir);
		boosted = true;
		max_spd = hsp;
	}
}

// ammo
if !key_piss {
	if ammo_refill_timer <= 0 {
		if ammo < ammo_max  ammo+=1;
	} else  ammo_refill_timer--;
}
if ammo < 0 {
	ammo_refill_timer = ammo_refill_timer_max*1.5;
	ammo = 0;
}