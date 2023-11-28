// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
scene = [0,0,0,0,0,0,0];
scene_indexer = 0;
timer = 0;

scene_info[0] = [
	[cutscene_nothing],
]

scene_info[1] = [
	[cutscene_nothing],
]

scene_info[2] = [
	[cutscene_nothing],
]

scene_info[3] = [
	[cutscene_nothing],
]

scene_info[4] = [
	[cutscene_nothing],
]

scene_info[5] = [
	[cutscene_nothing],
]

scene_info[6] = [
	[cutscene_nothing],
]

if !global.debug.debugshow and sprite_index == EventBox image_alpha = 0;

//scene_info[0] = [
//	// State 0
//	[cutscene_step_selection, 0, 1, 4],
//	// Page selection if arg1 == arg2, then scene = 3
	
//	[cutscene_section_start, false],
//	[cutscene_wait, 5, true],	
	
//	// ===== Next Page ===== //
//	[cutscene_reset,0],
//	[cutscene_section_end, false]
//]
//scene_info[1] = [
//	// State 1
//]