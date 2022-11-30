draw_self();
var h = (hp/hp_max)*100;
draw_set_alpha((100-h)*0.01);
gpu_set_fog(true,c_yellow,0,0);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,(100-h)*0.01);
gpu_set_fog(false,0,0,0);
draw_set_alpha(1);
