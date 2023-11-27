/// @description Insert description here
// You can write your code in this editor
count++;
sdm("OBJECT ", global.player);
// Inherit the parent event
event_inherited();
event_user(0);
	if scene_indexer < 2 {
		if place_meeting(x,y,global.player) {
			scene_indexer = 1;
			}
		else scene_indexer = 0
	}


