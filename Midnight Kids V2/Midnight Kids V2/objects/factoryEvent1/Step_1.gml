
scene_info[0] = [
	// PAGE CONFIG - Configurações de página, como trigger e qual página da cutscene tá ativa
	//* [on_trigger, self, global.player],
	//[cutscene_switched_page, 0, true, 2],
	[cutscene_start, -1, true, true, "", "", 0, true, 2],
	
	
	[manage_spiffs, false],
	// Muda de página se o trigger id/name(arg1) tiver um value igual ao arg2, se sim, pula pra pagina arg3. 
	//[cutscene_section_start, true, true],
	// Trava o player
	[manage_party, 0, -1],	
	//[manage_follower, 1, -1],
	// CUSTOMIZATION - Adicione conteudo aqui nessa sessão. 
	[cutscene_wait, 50],
	[balloon, balloon_Duvida, global.player, true, 0, true],
	[cutscene_wait, 50],
	[bubble_speech,global.player,global.language.main.s0.m1,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_change_graphic, global.player, sAnnieWalking],
	[cutscene_move,"down", 1, 60, true, global.player],
	[cutscene_change_graphic, global.player, sAnnieIdle],
	
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 60],
	[bubble_speech,global.player,global.language.main.s0.m2,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_wait, 60],
	
	
	[cutscene_change_graphic, global.player, sAnnieWalking],
	[cutscene_move,"right", 1, 30, true, global.player],
	[cutscene_change_graphic, global.player, sAnnieIdle],
	
	[cutscene_wait, 60],
	[bubble_speech,global.player,global.language.main.s0.m3,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_look_direction,global.player,-1],
	
	[cutscene_change_graphic, global.player, sAnnieWalking, -1],
	[cutscene_move,"left", 1, 60, true, global.player],
	[cutscene_change_graphic, global.player, sAnnieIdle, -1],
	
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 60],
	[bubble_speech,global.player,global.language.main.s0.m4,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_wait, 50],
	[balloon, balloon_exclamacao, global.player, true, 0, true],
	[cutscene_wait, 50],
	[cutscene_camera_change, inst_35051589],
	[cutscene_wait, 100],
	[cutscene_camera_change, global.player],
	[cutscene_wait, 40],
	[bubble_speech,global.player,global.language.main.s0.m5,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[trigger_change, 0, true],
	[cutscene_change_graphic, global.player, -1],
	// FINISHING				
	[cutscene_section_end],
	//[manage_follower, 1, 1, playerB],
	
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]