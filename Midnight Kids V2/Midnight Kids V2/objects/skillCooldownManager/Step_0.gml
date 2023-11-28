/*
function verify(playerid){
	if playerid != -1 {
		
		
		if global.player_stats[playerid].skillcooldown[i] != 0
		{
			global.player_stats[playerid].skillcooldown[i]--;
		}
		else if global.player_stats[playerid].skillcooldown[i] == 0 and global.player_stats[playerid].skillid[i] != -1
		{
			global.player_stats[playerid].skillid[i] = -1;
		}		
	}
}

for(j=0;j<array_length(global.party.players);j++){
	for(i=0;i<30;i++){
		verify(global.party.players[j]);
	}
}