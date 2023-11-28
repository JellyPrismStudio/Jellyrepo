state_machine = 0;
event_inherited();
scene_info[0] = [
	//[cutscene_wait_for_input_on_collission, "k", vk_space, self.id,global.player],
	//[cutscene_next_step_collider,self, vk_space, global.player],
	[popup_on_trigger, inst_6356A3F4,inst_6356A3F4, "Interagir", "", c_white, 0, true, 0, global.mainplayer],
	[cutscene_skip_page_other,1,inst_6356A3F4, 0],
	//Pula a página do superEvent (pagina, superEvent.id, evento da página) 
	[bubble_speech_on_trigger, inst_6356A3F4,inst_6356A3F4,"...","Test Bot",c_red,0,false,0,global.mainplayer],
	[cutscene_variable, inst_6356A3F4, "state_machine", 0],
	[cutscene_alarm_pathfinder, inst_6356A3F4, "state_machine", 2, 0, 10, 825, 565, 1],
	[bubble_speech_on_trigger, inst_6356A3F4,inst_6356A3F4,"Yes baby","Test Bot",c_red,0,false,0,global.mainplayer],
	//volta o movement route do superEvent
	[cutscene_variable, inst_6356A3F4, "state_machine", -1],
	[cutscene_skip_page_other,0,inst_6356A3F4, 0],
	//Pula a página do superEvent
	[bubble_speech_on_trigger, inst_6356A3F4,inst_6356A3F4,"Yes baby2","Test Bot",c_red,0,false,0,global.mainplayer],
	[cutscene_skip_page_other,1,inst_6356A3F4, 0],
	[cutscene_alarm_pathfinder, inst_6356A3F4, "state_machine", 2, 0, 10, 320, 120, 3],
	[cutscene_next_step_collider,self, false, global.player],
	[popup_on_trigger, inst_6356A3F4,inst_6356A3F4, "Interagir", "", c_white, 0, true, 12, global.mainplayer],
	[cutscene_alarm_pathfinder, inst_6356A3F4, "state_machine", 2, 0, 10, 230, 410, 3],
	//volta o movement route do superEvent
	[cutscene_variable, inst_6356A3F4, "state_machine", -1],
	[cutscene_skip_page_other,0,inst_6356A3F4, 0],
	[cutscene_reset],
	//[cutscene_move,"down",1,100,false,self],
	//[cutscene_pathfind_move, self, 511, 357, 1],
]
scene_info[1] = [
	[cutscene_do_nothing],
]