/// @description Insert description here
var finalxp = xp + global.player_stats[global.player_index].xp;
if finalxp > global.player_stats[global.player_index].exp_needed[global.player_stats[global.player_index].level-1] {
	levelup(global.player_index);
	var yy = y - global.player.sprite_height;
	instance_create_depth(x,yy,global.intern.depths.over,_BATTLE_LEVELUP);
}
global.player_stats[global.player_index].xp += xp;
instance_create_depth(x,y,depth,oFx_Explosion1);

lootsize = array_length(loot);
for(i=0;i<lootsize;i++){
	get_loot(lootchnc[i], loot[i].worlditem);	
}

// You can write your code in this editor


