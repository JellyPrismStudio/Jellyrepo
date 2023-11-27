try{
	super = global.party.playersobj[1];
	name = global.player_stats[global.party.players[1]].nome;
	x = super.x;
	y = super.y - super.sprite_height;
	// 
}
catch(error)
{
	
}

if global.party.players[1] == -1 instance_destroy();