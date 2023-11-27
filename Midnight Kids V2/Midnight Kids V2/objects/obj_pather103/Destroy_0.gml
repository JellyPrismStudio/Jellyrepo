/// @description Insert description here
var finalxp = xp + global.player_stats[global.player_index].xp;
if finalxp > global.player_stats[global.player_index].exp_needed[global.player_stats[global.player_index].level-1] {
	levelup(global.player_index);
	var yy = y - global.player.sprite_height;
	instance_create_depth(x,yy,-1010001,_BATTLE_LEVELUP);
}
global.player_stats[global.player_index].xp += xp;

get_loot(70, loot_copper_coin);
get_loot(30, loot_gold_coin);
// You can write your code in this editor


