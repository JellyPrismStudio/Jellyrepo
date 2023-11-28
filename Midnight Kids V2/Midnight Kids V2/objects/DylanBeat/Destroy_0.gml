if global.player_stats[3].hp > 0 {
	if int64((array_length(IDS)*global.player_stats[3].magic)/mult) > 0 {
	
		battle_create_popup(global.player, int64((array_length(IDS)*global.player_stats[3].magic)/mult), true, global.player_stats[global.player_index])
		if global.player_stats[3].hp < global.player_stats[3].mhp global.player_stats[3].hp += int64((array_length(IDS)*global.player_stats[3].magic)/mult)
		clamp(global.player_stats[3].hp, 0, global.player_stats[3].mhp);
	}
	else
	{
		//if global.player_stats[3].hp < global.player_stats[3].mhp battle_create_popup(global.player, 1, true, global.party.playersobj[0])
	}
}

