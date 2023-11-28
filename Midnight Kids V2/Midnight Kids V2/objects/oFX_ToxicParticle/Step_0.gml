if !on_view(){
	image_alpha -= 0.1
}
else
{
	image_alpha -= 0.007	
}

if image_alpha <= 0.01 instance_destroy();

if place_meeting(x,y,global.player) and !damaging and image_alpha < 0.8 and image_alpha > 0.2{
	var dmg = global.player_stats[global.player_index].hp / 15
	battle_deal_damage(dmg);	
	damaging = true;
	global.player.damaged = true;
	global.player.BATTLE_D = 5;
}