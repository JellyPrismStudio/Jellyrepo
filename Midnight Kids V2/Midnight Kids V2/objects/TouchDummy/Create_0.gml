/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scene_info[0] = [
	[cutscene_do_nothing_trigger, self.id, global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"Cade o véqina","Maico",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,global.player,"n sei pora kkkkkkkkk","Uiu",c_red,0,true,0,global.player],
	//[bubble_speech_on_trigger, self.id,objectSuper,"Beautiful night, huh?","Tim",0,true,0,global.player],
	//[bubble_speech_on_trigger, self.id,global.player,"Yup!","Tim",0,true,0,global.player],
	[cutscene_goto,0]
]