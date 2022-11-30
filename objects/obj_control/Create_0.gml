global.players_list = ds_list_create();

randomize();
hue = random_range(125,255);
//alarm[0] = 60;
slowmo = false;
global.game_over = false;
global.winner = noone;

global.player_wins = ds_map_create();
global.player_wins[? obj_player1] = 0;
global.player_wins[? obj_player2] = 0;
global.player_wins[? obj_player3] = 0;
global.player_wins[? obj_player4] = 0;
global.player_kills = ds_map_create();
global.player_kills[? obj_player1] = 0;
global.player_kills[? obj_player2] = 0;
global.player_kills[? obj_player3] = 0;
global.player_kills[? obj_player4] = 0;

global.stages = ds_list_create();
ds_list_add(global.stages,rm_battle1);
ds_list_add(global.stages,rm_battle2);
ds_list_add(global.stages,rm_battle3);
