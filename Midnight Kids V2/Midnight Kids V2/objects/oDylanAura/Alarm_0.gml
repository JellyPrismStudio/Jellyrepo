if int64((array_length(IDS)*atack)/3) > 0 {
	
	battle_create_popup(global.player, int64((array_length(IDS)*atack)/2), true, global.player_stats[global.player_index])
	
}
else
{
	if global.player_stats[3].hp < global.player_stats[3].mhp battle_create_popup(global.player, 1, true, global.party.playersobj[0])
}
instance_destroy();