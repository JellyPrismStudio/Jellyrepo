try{
	super = global.party.playersobj[0];
	name = global.player_stats[global.party.players[0]].nome;
	x = super.x;
	y = super.y - super.sprite_height;
	// 
}
catch(error)
{
	if !instance_exists(super) instance_destroy();
}