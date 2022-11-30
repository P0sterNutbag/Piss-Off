vsp += grav;

x += hsp; y += vsp;

var stain = instance_place(x,y,obj_peestain);
if stain {
	if !stain.visible {
		stain.visible = true;
		stain.alarm[0] = stain.timer;
	}
}

if tile_meeting(x,y,"solid") {
	var xx = x div 8;
	var yy = y div 8;
	//instance_create_layer(xx*8,yy*8,"stains",obj_peestain)
	
	hsp = lerp(hsp,0,0.5);
	vsp = lerp(vsp,0,0.5);
	grav = lerp(grav,0,0.02);
	instance_destroy();
}



// animate
image_angle = point_direction(xprevious,yprevious,x,y);
