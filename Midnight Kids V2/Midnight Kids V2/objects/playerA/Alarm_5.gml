if global.party.players[0] != self_index and global.player_stats[self_index].hp > 0
{
	var inst = instance_nearest(x, y, oENM_Main)
	if inst != -4
	{
		if inst.get_player > -1 and point_distance(x,y,inst.x,inst.y) < 370
		{
			instance_create_depth(x,y,depth,SkillTaunt)
		}
	}
}
alarm_set(5, global.player_stats[self_index].skillfreq)