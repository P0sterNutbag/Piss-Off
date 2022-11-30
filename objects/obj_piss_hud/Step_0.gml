vsp += grav;

x += hsp; y += vsp;

if y > 300  instance_destroy();

// animate
image_angle = point_direction(xprevious,yprevious,x,y);
