if global.game_over and game_get_speed(gamespeed_fps) > 30 and instance_exists(global.winner) {
	var w = base_width/3;
	var h = w*height_ratio;
	width = lerp(width,w,0.1);
	height = lerp(height,h,0.1);
	
	var xx = global.winner.x;
	xx -= width/2;
	//xx = clamp(xx,0,base_width-width);
	var yy = global.winner.y;
	yy -= height/2;
	//yy = clamp(yy,0,base_height-height);

	xpos = lerp(xpos,xx,1);
	ypos = lerp(ypos,yy,1);

	camera_set_view_pos(view_camera[0],xpos,ypos);

	camera_set_view_size(view_camera[0],width,height);
	
	obj_hud.draw_confetti = true;
}

/*player_count = ds_list_size(global.players_list);
if player_count > 0 and room != rm_join and instance_exists(par_player) {
// get player locations
for (var i=0; i<player_count; i++) {
	players_xpos[i] = global.players_list[| i].x;
}
var x_min = scr_array_get_min(players_xpos);
var x_max = scr_array_get_max(players_xpos);
for (var i=0; i<player_count; i++) {
	players_ypos[i] = global.players_list[| i].y;
}
var y_min = scr_array_get_min(players_ypos);
var y_max = scr_array_get_max(players_ypos);

// set cam size
var w = x_max-x_min+120;
//var w = point_distance(obj_player1.x,obj_player1.y,obj_player2.x,obj_player1.y)+120;
var h = y_max-y_min+120;
if w > h  h = w*height_ratio;
else  w = h*width_ratio;
w = clamp(w,width_min,width_max);
h = clamp(h,width_min*height_ratio,width_max*height_ratio);
width = lerp(width,w,0.1);
height = lerp(height,h,0.1);
camera_set_view_size(view_camera[0],width,height);


// set cam position
var x_total = 0
for (var i=0; i<player_count; i++) {
	x_total += global.players_list[| i].x;
}
var xx = x_total/player_count;
xx -= width/2;
xx = clamp(xx,0,base_width-width);
xpos = lerp(xpos,xx,0.1);
var y_total = 0
for (var i=0; i<player_count; i++) {
	y_total += global.players_list[| i].y;
}
var yy = y_total/player_count;
yy -= height/2;
yy = clamp(yy,0,height_max-height);
ypos = lerp(ypos,yy,0.1);
camera_set_view_pos(view_camera[0],xpos,ypos);
}

//camera_set_view_size(view_camera[0],width,height);

/* move //
if instance_exists(cam_target) {
	var xx,yy;
	xx = cam_target.x-(width/2)+xoffset;
	yy = cam_target.y-(height/2)-yoffset;
	/*var mr = instance_position(cam_target.x,cam_target.y-4,obj_miniroom);
	if mr {//and !other_mr {
		xx = clamp(xx,mr.bbox_left+xoffset*2,mr.bbox_right-width);
		yy = clamp(yy,mr.bbox_top-yoffset,mr.bbox_bottom-height);
	}*/
/*}

xpos = lerp(xpos,xx,1);
ypos = lerp(ypos,yy,1);

camera_set_view_pos(view_camera[0],xpos,ypos);

camera_set_view_size(view_camera[0],width,height);
