/// @description Insert description here
image_alpha -= 0.004;
if image_alpha <= 0.01 instance_destroy();
if place_meeting(x,y,global.player) and !damaging{
	battle_deal_damage(dmge);	
	damaging = true;
}
// You can write your code in this editor


