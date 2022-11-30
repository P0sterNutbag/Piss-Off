#macro TILE_SIZE 16

function tile_meeting(xx,yy,l) {
	///@description tile_meeting(x,y,layer)
	///@param x
	///@param y
	///@param layer
	var _layer = argument2,
	    _tm = layer_tilemap_get_id(_layer);

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right+ (argument0 - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			if (tile_get_index(tilemap_get(_tm, _x, _y))) {
				var n = tile_get_index(tilemap_get(_tm, _x, _y));
				return true;
			}
		}
	}

	return false;
}
function tile_position_meeting(xx,yy,l) {
	///@description tile_position_meeting(x,y,layer)
	///@param x
	///@param y
	///@param layer
	var _layer = l,
	    _tm = layer_tilemap_get_id(_layer);
	var _x1 = tilemap_get_cell_x_at_pixel(_tm, xx,yy),
    var _y1 = tilemap_get_cell_y_at_pixel(_tm, xx, yy),
	if(tile_get_index(tilemap_get(_tm, _x1, _y1))){
	   return true;
    }
	
	return false;
}
function scr_collision(xmove, ymove, sol) {
	// define boundaries
	var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
	var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
	var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
	
	// horizontal collisions
	x += xmove;
	var par_sol = instance_place(x+sign(xmove),y,par_solid);
	if (par_sol and !object_is_ancestor(par_sol.object_index,sol)) or place_meeting(x+sign(xmove),y,sol) {
	    if par_sol  var wall = instance_place(x+sign(xmove),y,par_sol);
		else  wall = instance_place(x+sign(xmove),y,sol);
	    if xmove > 0 { //right
	        x = (wall.bbox_left-1)-sprite_bbox_right;
	    } else if xmove < 0 { //left
	        x = (wall.bbox_right+1)-sprite_bbox_left;
	    }
	    xmove = 0;
	}

	// vertical collisions
	y += ymove;
	var par_sol = instance_place(x,y+sign(ymove),par_solid);
	if (par_sol and !object_is_ancestor(par_sol.object_index,sol)) or place_meeting(x,y+sign(ymove),sol) {
		if par_sol  var wall = instance_place(x, y+sign(ymove), par_sol);
		else  wall = instance_place(x,y+sign(ymove),sol);
	    if (ymove > 0) { //down
	        y = (wall.bbox_top-1) - sprite_bbox_bottom;
	    } else if (ymove < 0) { //up
	        y = (wall.bbox_bottom+1) - sprite_bbox_top;
	    }
		ymove = 0;
	}
}
function scr_move_collide(xspeed,yspeed,_layer) {
	///@param x
	///@param y
	///@param layer
	on_ground = false;
	var slope = collision_line(x,y,x,y+2,obj_slope,false,false);
	if slope {
		var ratio = (x-slope.x)/slope.sprite_width;
		var yy = slope.y-(slope.sprite_height*ratio);
	}
	if slope and y >= yy-1 {
		on_ground = true;
		y = yy;
		if yspeed < 0  y += yspeed;
		x += xspeed;
	} else {
		if tile_meeting(x+sign(xspeed),y,_layer) {
			if place_meeting(x,y+1,obj_slope) {
				while tile_meeting(x+sign(xspeed),y,_layer) {
					y-=0.1;
				}
			} else {
				if xspeed > 0 {
					x = x-(x mod TILE_SIZE)+(TILE_SIZE-0.01)-(bbox_right-x);
				} else {
					x = x-(x mod TILE_SIZE)-(bbox_left-x);
				}
				xspeed = 0;
			}
		}
		x += xspeed;
		if tile_meeting(x,y+yspeed,_layer) {
			if yspeed > 0 {
				y = y-(y mod TILE_SIZE)+(TILE_SIZE-0.01)-(bbox_bottom-y);
				on_ground = true;
			} else {
				y = y-(y mod TILE_SIZE)//-(bbox_top-y);
			}
			yspeed = 0;
			vsp = 0;
		} else if tile_meeting(x,y+1,_layer)  on_ground = true;
		else {
			var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+vsp+1,obj_platform,false,false);
			if platform and yspeed >= 0 {
				on_ground = true;
				var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
		        y = (platform.bbox_top-1) - sprite_bbox_bottom;
				yspeed = 0;
				vsp = 0;
			}
		}
		y += yspeed;
	}
	/* slopes
	var slope = instance_position(x,y-1,obj_slope);
	if slope {
		var ratio = (x-slope.x)/slope.sprite_width;
		y = slope.y-(slope.sprite_height*ratio);
	}*/
}
function scr_move_bounce(xspeed,yspeed,_layer) {
	///@param x
	///@param y
	///@param layer
	if tile_meeting(x+sign(xspeed),y,_layer) {
		if xspeed > 0 {
			x = x-(x mod TILE_SIZE)+(TILE_SIZE-0.01)-(bbox_right-x);
		} else {
			x = x-(x mod TILE_SIZE)-(bbox_left-x);
		}
		xspeed = 0;
		hsp = -hsp*bounce_ratio;
		if object_is_ancestor(object_index,par_weapon) {
			arc = true;
			vsp *= bounce_spd;
		}
	}
	x += xspeed;
	if tile_meeting(x,y+yspeed,_layer) {
		if yspeed > 0 {
			y = y-(y mod TILE_SIZE)+(TILE_SIZE-0.01)-(bbox_bottom-y);
			vsp = -vsp*bounce_ratio;
			if object_is_ancestor(object_index,par_weapon) {
				if abs(vsp) < 0.25  state = states.wait;
			}
		} else {
			y = y-(y mod TILE_SIZE)+(sprite_yoffset);
			vsp = -vsp*bounce_ratio;
		}
		yspeed = 0;
		if object_is_ancestor(object_index,par_weapon) {
			arc = true
			hsp *= bounce_spd;
		}
	}
	y += yspeed;
	// slopes
	var slope = instance_position(x,y,obj_slope);
	if slope {
		//vsp = -vsp;
	}
}
function scr_room_transition(room_targ,xx,yy) {
	with obj_control {
		transition_phase = 0;
		my_room = room;
		room_destination = room_targ
		player_spawn_x = xx;
		player_spawn_y = yy;
	}
}
function scr_get_candy(amount) {
	var len = ds_list_size(global.candies)-1;
	var my_candy;
	my_candy[0] = "wow";
	for (var i=0; i<amount; i++) {
		var index = irandom(len);
		for (var k=0; k<array_length(my_candy); k++) {
			while global.candies[| index] == my_candy[k] {
				var index = irandom(len);
			}
		}
		my_candy[i] = global.candies[| index];
	}
	return my_candy;
}
function scr_get_candy_list(amount) {
	var len = ds_list_size(global.candies)-1;
	my_candy = ds_list_create();
	for (var i=0; i<amount; i++) {
		var index = irandom(len);
		for (var k=0; k<ds_list_size(my_candy); k++) {
			while global.candies[| index] == my_candy[| k] {
				var index = irandom(len);
			}
		}
		my_candy[| i] = global.candies[| index];
	}
}
function scr_get_candy_type_list(text_array) {
	var len = array_length(text_array);
	my_candy = ds_list_create();
	taken_candy = 0;
	for (var i=0; i<len; i++) {
		my_candy[| i] = text_array[i];
	}
}
function scr_drop_candy(candy) {
	var i = global.candy_lane;
	with instance_create_layer(15+(8*i),50,"control",obj_candy) {
		sprite_index = global.candy_sprites[? candy];
	}
	global.candy_lane++;
	if global.candy_lane > global.candy_lane_max  global.candy_lane = 0;
}

function scale_canvas(base_width, base_height, current_width, current_height, center) {
	/// @param {int}    base width      The base width for the game room
	/// @param {int}    base height     The base height for the game room
	/// @param {int}    current width   The current width of the game canvas
	/// @param {int}    current height  The current height of the game canvas
	/// @param {bool}   center          Set whether to center the game window on the canvas or not

	var _bw = base_width;
	var _bh = base_height;
	var _cw = current_width;
	var _ch = current_height;
	var _center = center;
	var _aspect = (_bw / _bh);

	if ((_cw / _aspect) > _ch)
	    {
	    window_set_size((_ch *_aspect), _ch);
	    }
	else
	    {
	    window_set_size(_cw, (_cw / _aspect));
	    }
	if (_center)
	    {
	    window_center();
	    }

	view_wport[0] = min(window_get_width(), _bw);
	view_hport[0] = min(window_get_height(), _bh)
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}
function canvas_fullscreen(base) {
	/// @param {int}    base    The base value for scaling on both axis

	var _base = base;
	var _bw = browser_width;
	var _bh = browser_height;

	view_wport[0] = _bw;
	view_hport[0] = _bh;
	window_set_size(_bw, _bh);
	window_center();

	var _aspect = (_bw / _bh);
	if (_aspect < 1)
	    {
	    var _vw = _base * _aspect;
	    var _vh = _base;
	    }
	else
	    {
	    _vw = _base;
	    _vh = _base / _aspect;
	    }

	camera_set_view_size(view_camera[0], _vw, _vh);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}
function scr_array_get_max(array) {
	var maxValue = 0;
	for (var i = 0; i < array_length(array); i++) {
	    // Check if this is larger than our stored one
	    if (array[i] > array[maxValue]) {
			maxValue = i;
	    }
	}
	return array[maxValue];
}
function scr_array_get_min(array) {
	var minValue = 0;
	for (var i = 0; i < array_length(array); i++) {
	    // Check if this is larger than our stored one
	    if (array[i] < array[minValue]) {
			minValue = i;
	    }
	}
	return array[minValue];
}
function scr_create_partical(spr) {
	with instance_create_layer(x,y,"particals",obj_partical) {
		sprite_index = spr;
	}
}
function draw_circular_bar(xx ,yy ,value, max_value, colour, radius, transparency, width) {
	if (argument2 > 0) { // no point even running if there is nothing to display (also stops /0
	    var i, len, tx, ty, val;
    
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360/numberofsections
    
	    val = (argument2/argument3) * numberofsections 
    
	    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
	        piesurface = surface_create(argument5*2,argument5*2)
            
	        draw_set_colour(argument4);
	        draw_set_alpha(argument6);
        
	        surface_set_target(piesurface)
        
	        draw_clear_alpha(c_blue,0.7)
	        draw_clear_alpha(c_black,0)
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(argument5, argument5);
        
	        for(i=0; i<=val; i++) {
	            len = (i*sizeofsection)+90; // the 90 here is the starting angle
	            tx = lengthdir_x(argument5, len);
	            ty = lengthdir_y(argument5, len);
	            draw_vertex(argument5+tx, argument5+ty);
	        }
        
	        draw_primitive_end();
        
	        draw_set_alpha(1);
	        gpu_set_blendmode(bm_subtract);
	        draw_set_colour(c_black);
	        draw_circle(argument5-1, argument5-1,argument5-argument7,false)
	        gpu_set_blendmode(bm_normal);

	        surface_reset_target()
     
	        draw_surface(piesurface,argument0-argument5, argument1-argument5)
        
	        surface_free(piesurface)
	    }
	}
}