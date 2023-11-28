/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scene_info[0] = [
	[on_trigger, self, global.player],
	[cutscene_low_priority],
	[popup_on_trigger, self,self, global.language.presets.interact, "", c_white, 0, true, 0, global.player],
	[cutscene_variable,inst_8536783, "time", 130],
	[cutscene_reset],
]

scene_info[1] = [
	[cutscene_nothing],
]