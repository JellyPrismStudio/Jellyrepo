if !on_view(){
	image_alpha -= 0.1
}
else
{
	image_alpha -= 0.008	
}

if image_alpha <= 0.01 instance_destroy();

if place_meeting(x,y,global.player) and !damaging and image_index < (sprite_get_number(sprite_index) - 10){
	var dmg = magic;
	battle_deal_magic_damage(dmg);	
	damaging = true;
	global.player.damaged = true;
	global.player.BATTLE_D = 5;
}