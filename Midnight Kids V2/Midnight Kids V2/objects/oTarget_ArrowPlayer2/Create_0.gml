if global.party.players[1] != -1
{
	super = noone;
	super = global.party.playersobj[1];
	name = global.player_stats[global.party.players[1]].nome;
	depth = global.intern.depths.msg;
}
else image_alpha = 0;