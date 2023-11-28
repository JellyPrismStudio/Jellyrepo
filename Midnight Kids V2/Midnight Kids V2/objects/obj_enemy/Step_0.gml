/// @description Insert description here
// You can write your code in this editor

//draw_self();
if kget_radius(self.id,30,false,true,true,global.player) scene_indexer = 3
else if kget_radius(self.id,70,false,true,true,global.player) scene_indexer = 2
else if kget_radius(self.id,120,false,true,true,global.player) scene_indexer = 1
else scene_indexer = 0

// Inherit the parent event
event_inherited();

