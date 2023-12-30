if global.party.players[0] != self_index and global.player_stats[self_index].hp > 0
{
	instance_create_depth(x,y,depth,SkillTaunt)
}
alarm_set(5, global.player_stats[self_index].skillfreq)