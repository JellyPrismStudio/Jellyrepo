if global.party.players[0] != self_index 
{
	instance_create_depth(x,y,depth,loot_coins)
}
alarm_set(5, global.player_stats[self_index].skillfreq)