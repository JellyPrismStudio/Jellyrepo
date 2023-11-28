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
	[cutscene_switched_page, 2, true, 2],
	
	
	
	// Muda de página se o trigger id/name(arg1) tiver um value igual ao arg2, se sim, pula pra pagina arg3. 
	[cutscene_section_start, true, true],
	// Trava o player
	//[manage_follower, 1, -1],
	// CUSTOMIZATION - Adicione conteudo aqui nessa sessão. 
	[cutscene_wait, 50],
	[balloon, balloon_Duvida, global.player, true, 0, true],
	[cutscene_wait, 50],
	
	[cutscene_move_anim,"up", 1, 80,spriteIdle,spriteWalk, 1, true, global.player],

	[cutscene_wait, 50],
	[balloon, balloon_exclamacao, global.player, true, 0, true],
	[cutscene_wait, 50],
	
	[bubble_speech,global.player,global.language.main.s0.m11,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_camera_change, CameraFocus1],
	
	[cutscene_move_anim,"up", 1, 240,spriteIdle,spriteWalk, 1, true, global.player],
	
	[bubble_speech,global.player,global.language.main.s0.m12,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	[cutscene_move_anim,"right", 1, 60,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 50],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 50],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 50],
	
	[bubble_speech,global.player,global.language.main.s0.m13,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_instanciate_object,266,323,depth,evMonster],
	
	[cutscene_move_anim,"right", 1, 340,spriteIdle,spriteWalk, 1, true, evMonster],
	[cutscene_wait, 50],
	
	[cutscene_look_direction,global.player,-1],
	[bubble_speech,global.player,global.language.main.s0.m14,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	[cutscene_move_anim,"right", 1, 70,spriteWalk,spriteWalk, 1, true, evMonster],
	[bubble_speech,evMonster,global.language.main.s0.m15,global.language.presets.unknown, 1, 0, global.config.textcolor, c_red],
	[bubble_speech,global.player,global.language.main.s0.m16,global.language.presets.unknown, 1, 0, global.config.textcolor, c_olive],
	
	
	[cutscene_fade_out, 3],
	[cutscene_wait, 50],
	[cutscene_section_end],
	//[manage_follower, 1, 1, playerB],
	[trigger_change, 2, true],
	[manage_follower,1, 2, playerHanna],
	[cutscene_change_room, rDinersOut],
	[cutscene_change_coordinates,global.player, 400, 400],
	[cutscene_fade_in, 3],
	[cutscene_delete_object, id],
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]

