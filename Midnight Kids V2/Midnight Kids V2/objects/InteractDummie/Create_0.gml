// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
scene = [0,0,0,0,0,0,0];
scene_indexer = 0;
timer = 0;

scene_info[0] = [
	[cutscene_do_nothing],
	[bubble_speech_on_trigger, self.id,Inst_Dummy,"Ola","error",0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,global.player,"Olaaaaaaaaaaaaaaaaaa","Kauzz",0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,Inst_Dummy,"Ola\naaaaaaaaaaaaaaaaa","error",0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,global.player,"O","error",0,true,0,global.player],
	[cutscene_goto, 0],
]