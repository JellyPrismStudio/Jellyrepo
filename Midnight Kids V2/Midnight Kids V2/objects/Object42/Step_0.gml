/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

if scene_indexer < 2 {
	if place_meeting(x,y,global.player) {
		scene_indexer = 1;
		}
	else scene_indexer = 0
}

