// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
scene = [0,0,0,0,0,0,0];
scene_indexer = 0;
timer = 0;

scene_info[0] = [
	// State 0
	[cutscene_step_selection, 0, 1, 4],
	// Page selection if arg1 == arg2, then scene = 3
	
	[cutscene_section_start, false],
	[cutscene_wait, 5, true],	
	[cutscene_move, "up", 1, 70, true, self.id],
	
	// ===== Next Page ===== //
	[cutscene_reset,0],
	[cutscene_section_end, false]
]
scene_info[1] = [
	[cutscene_section_start, true],
	[bubble_speech,self.id,"Teste de scene","",true,70,c_black],
	[bubble_speech,global.player.id,"Teste de scene?","",true,0,c_black],
	[bubble_speech,self.id,"Teste de scene!","",true,70,c_black],
	[cutscene_wait, 5, true],
	[cutscene_section_end, false]
	// State 1
]