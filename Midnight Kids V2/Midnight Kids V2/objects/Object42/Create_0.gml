/// @description Insert description here
// You can write your code in this editor

activated = false;

// Inherit the parent event
event_inherited();

scene_info[0] = [

	[cutscene_do_nothing],
	[cutscene_reset],
]
scene_info[1] = [
	[cutscene_lock_movement, false],
	[cutscene_object_fade,"in",0.02,1,0,self.id,true],
	[cutscene_skip_page, 2],
]	
scene_info[2] = [	
	[cutscene_change_room, Map001],
	[cutscene_object_fade,"out",0.02,0,1],
	[cutscene_lock_movement, true],
	[instance_destroy],
	[cutscene_goto_page_clean, 0, 0],	
]
