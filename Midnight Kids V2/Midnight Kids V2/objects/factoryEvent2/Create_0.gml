/// @description Insert description here
// You can write your code in this editor
//if live_call() return live_result;
// Inherit the parent event
event_inherited();
spriteIdle = sAnnieIdle;
spriteWalk = sAnnieWalking;

scene_info[0] = [
	// PAGE CONFIG - Configurações de página, como trigger e qual página da cutscene tá ativa
	//* [on_trigger, self, global.player],
	[cutscene_switched_page, 1, true, 2],
	
	
	
	// Muda de página se o trigger id/name(arg1) tiver um value igual ao arg2, se sim, pula pra pagina arg3. 
	[cutscene_section_start, true, true],
	// Trava o player
	//[manage_follower, 1, -1],
	// CUSTOMIZATION - Adicione conteudo aqui nessa sessão. 
	[cutscene_wait, 50],
	[balloon, balloon_Duvida, global.player, true, 0, true],
	[cutscene_wait, 50],
	
	[cutscene_change_graphic, global.player,spriteWalk],
	[cutscene_move_anim,"down", 1, 80,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_change_graphic, global.player,spriteIdle],

	[cutscene_look_direction, global.player,1],
	[bubble_speech,global.player,global.language.main.s0.m6,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_change_graphic, global.player,spriteWalk, 1],
	[cutscene_move_anim,"right", 2, 85,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_change_graphic, global.player,spriteIdle],
	
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 60],
	
	[bubble_speech,global.player,global.language.main.s0.m7,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_move_anim,"up", 2, 20,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_wait, 60],
	
	[cutscene_change_graphic, global.player,spriteWalk, -1],
	[cutscene_move_anim,"left", 2, 110,spriteIdle,spriteWalk, -1, true, global.player],
	[cutscene_change_graphic, global.player,spriteIdle],
	
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 20],
	[bubble_speech,global.player,global.language.main.s0.m8,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_change_graphic,inst_8536783,noone],
	[bubble_speech,global.player,global.language.main.s0.m9,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_move_anim,"right", 2, 100,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_change_graphic,inst_8536783,Sprite190],
	
	[balloon, balloon_exclamacao, global.player, true, 0, true],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 20],
	[bubble_speech,global.player,global.language.main.s0.m10,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_section_end],
	//[manage_follower, 1, 1, playerB],
	[trigger_change, 1, true],
	
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]

