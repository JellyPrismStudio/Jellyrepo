// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
scene = [0,0,0,0,0,0,0];
scene_indexer = 0;
timer = 0;

scene_info[0] = [
	//[cutscene_step_selection, 0, 0, 3],
	//Page selection
	
	[cutscene_section_start, false],
	[cutscene_wait, 5, true],	
	[cutscene_move, "upright", 1, 700, true, self.id],
	[cutscene_wait, 120],
	[cutscene_next_step, 1, 1, true, 0],
	
///// PAGE 2 ========================================================================================
	[cutscene_reset,0],
]
scene_info[1] = [
	//[cutscene_step_selection, 0, 0, 3],
	//Page selection
	
	[cutscene_section_start, false],
	[cutscene_wait, 5, true],	
	[cutscene_move, "upleft", 1, 700, true, self.id],
	[cutscene_wait, 120],
	[cutscene_next_step, 1, 1, true, 0],
	[cutscene_section_end, false]
]

scene_info[2] = [
	//[cutscene_step_selection, 0, 0, 3],
	//Page selection
	
	[cutscene_section_start, false],
	[cutscene_wait, 5, true],	
	[cutscene_move, "downleft", 1, 700, true, self.id],
	[cutscene_wait, 120],
	[cutscene_next_step, 1, 1, true, 0],
	[cutscene_section_end, false]
]