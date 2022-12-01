life = 3;
hp_max = 100;
hp = hp_max;
hp_regen_timer_max = 90;
hp_regen_timer = hp_regen_timer_max
hp_regen_rate = 0.2;
spd = 1;
max_spd = spd;
piss_walk_spd = 0.5;
stain_spd = 0.05;
roll_spd = 1.5;
can_roll_timer_max = 7;
can_roll_right_timer = 0;
can_roll_left_timer = 0;
jump_spd = 2.80;
grav = 0.1;
vsp_max = 3;
wall_slide_spd = 0.25;
air_spd = 0.1;
wall_jump_spd = 2.4;
stun_timer = 60;
airdashes_max = 1;
airdashes = airdashes_max;
knockback_hsp = 0.5;
knockback_vsp = 1.5;
explode_spd = 6;
ladder_spd = spd;

piss_spd = 3.5;
piss_charge_spd = 8;
piss_yoffset = 4;
ammo_max = 300;
ammo_refill_timer_max = 75;
ammo_refill_timer = ammo_refill_timer_max
ammo = ammo_max;
charge_timer_max = 60;
charge_timer = 0;
charge_repeat_max = 10;
charge_dmg_mult = 1.35;
charge_repeat = charge_repeat_max;
ra_deadzone = 0.5;

weapon_yoffset = 6;
weapon_xoffset = 6;

idle_sprite = spr_player_idle;
walk_sprite = spr_player_walk;
walk_piss_sprite = spr_player_walk_piss;
piss_sprite = spr_player_piss;
jump_sprite = spr_player_jump;
jump_piss_sprite = spr_player_jump_piss;
roll_sprite = spr_player_roll;
knockback_sprite = spr_player_knockback;
wallslide_sprite = spr_player_wallslide;


state = states.walk;
dir = 0;
hsp = 0; vsp = 0;
canshoot = true;
can_autofire = true;
flash = false;
boosted = false;
vaxis = 0; haxis = 0;
vaxisr = 0; haxisr = 0;
draw_arc = false;
my_weapon = noone;

on_ground = false;