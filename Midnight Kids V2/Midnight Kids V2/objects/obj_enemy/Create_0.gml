/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

scene_info[0] = [
	[bubble_speech,self.id,"0","Enemy",		true,0,#2a1c05, c_red],
	[bubble_speech,self.id,"01","Enemy",	true,0,#2a1c05, c_red],
	[bubble_speech,self.id,"02","Enemy",	true,0,#2a1c05, c_red],
	[bubble_speech,global.player,"03","Hero",		true,0,#2a1c05, c_olive],
	[bubble_speech,global.player,"04","Hero",		true,0,#2a1c05, c_olive],
	[bubble_speech,self.id,"05","Enemy",	true,0,#2a1c05, c_red],
	[cutscene_reset],
	//[bubble_speech,self.id,"0","Enemy"],
	//[cutscene_reset],
]
scene_info[1] = [
	[bubble_speech,self.id,"1","Enemy",true,0,c_green,#2a1c05,spr_BubbleSpeech2],
	[cutscene_reset],
]
scene_info[2] = [
	[bubble_speech,self.id,"2","Enemy",true,0,c_orange, c_red],
	[bubble_speech,self.id,"21","Enemy",true,0,c_orange, c_red],
	[cutscene_reset],
]
scene_info[3] = [
	[bubble_speech,self.id,"3","Enemy",true,0,c_red, c_red],
	[cutscene_reset],
]