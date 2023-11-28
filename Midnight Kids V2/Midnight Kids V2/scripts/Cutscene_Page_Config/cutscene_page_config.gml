// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function config_cutscene_on_trigger_parent(parent,pagegoto,pagereturn,collider1,collider2 = collider1){
	parent.x = self.x;
	parent.y = self.y;
	if place_meeting(collider1.x,collider1.y,parent) or place_meeting(collider2.x,collider2.y,parent) {isTrigger = true; parent.image_blend = c_red;}
	else {isTrigger = false; parent.image_blend = c_white;}
	if isTrigger and keyboard_check_pressed(vk_space) self.scene_indexer = pagegoto
	else if !isTrigger self.scene_indexer = pagereturn
}


//if place_meeting(global.player.x,global.player.y,TouchDummy) and keyboard_check_pressed(vk_space) scene_indexer = 1
//else if !place_meeting(global.player.x,global.player.y,TouchDummy) scene_indexer = 0