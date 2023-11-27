
var finalxp = xp + global.player_stats[global.player_index].xp;
var partyxp =  ceil(xp / 3 + xp/6)
if finalxp > global.player_stats[global.player_index].exp_needed[global.player_stats[global.player_index].level-1] {
	levelup(global.player_index);
	var yy = y - global.player.sprite_height;
	instance_create_depth(x,yy,global.intern.depths.over,_BATTLE_LEVELUP);
}


global.player_stats[global.player_index].xp += xp;
if global.party.players[1] != -1 {
	if finalxp > global.player_stats[global.party.players[1]].exp_needed[global.player_stats[global.party.players[1]].level-1] {
	levelup(global.party.players[1]);
	var yy = y - global.player.sprite_height;
	instance_create_depth(x,yy,global.intern.depths.over,_BATTLE_LEVELUP);
	}
	global.player_stats[global.party.players[1]].xp += partyxp;
}
if global.party.players[2] != -1 {
	if finalxp > global.player_stats[global.party.players[2]].exp_needed[global.player_stats[global.party.players[2]].level-1] {
	levelup(global.party.players[2]);
	var yy = y - global.player.sprite_height;
	instance_create_depth(x,yy,global.intern.depths.over,_BATTLE_LEVELUP);
	}
	global.player_stats[global.party.players[2]].xp += partyxp;
}


instance_create_depth(x,y,depth,oFx_Explosion1);
for(l=0;l<array_length(global.enemy_stats[myid].loot);l++){
	get_loot(global.enemy_stats[myid].lootchances[l], global.enemy_stats[myid].loot[l].worlditem);	
}
// You can write your code in this editor


