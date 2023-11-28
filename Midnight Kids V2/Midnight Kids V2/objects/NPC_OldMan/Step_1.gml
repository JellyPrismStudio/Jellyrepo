#region PARENT EVENT
with (parEvent){
	
	
	scene_info[0] = [
		[on_trigger_priority, super, global.mainplayer],
		// Se for triggado, executa.
		[popup_on_trigger, super, super, global.language.chat._interact._2, "", c_white, 0, true, 0, global.player],
		// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
		[cutscene_skip_page_other,1,super, 0],
		// Esse evento pula a página do Super Event, ou seja, muda a página do "ROUTINES" de 0 pra 1
		
		[cutscene_section_start, !super._block, self.id],
		// Esse evento inicia a seção, negando outros eventos paralelos de acontecer
		[cutscene_look_direction, super],
		[cutscene_look_direction, global.player, super, false],
		// Olha para o pesonagem
		[cutscene_camera_change, NPC_OldMan],
		[cutscene_wait, 20],
		[balloon, balloon_Duvida, super, true, 30, true],
		[cutscene_wait, 20],
		[instanciate_choices, global.language.chat._5.a.choice1, global.language.chat._5.a.choice2, "", 2, 4],
		[cutscene_variable_page, _choice, 2, 4, 2],
		
		[cutscene_skip_page_other,0,super, 0],
		[cutscene_reset],
		// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
	]
	scene_info[1] = [
		[cutscene_goto_page,0,-1],
		// Esta página não está sendo usada
	]
	scene_info[2] = [
		[bubble_speech,super,global.language.chat._5.a.oldman1,global.language.chat._5.a.oldman1name],
		[bubble_speech_party,global.player,global.language.chat._5.a,global.player_stats[global.player_index].nome, 1, 0, global.config.textcolor, c_olive],
		[bubble_speech,super,global.language.chat._5.b.oldman1,global.language.chat.npc.oldman1name],
		[bubble_speech_party,global.player,global.language.chat._5.b,global.player_stats[global.player_index].nome, 1, 0, global.config.textcolor, c_olive],
		[cutscene_camera_change],
		// Mostra a mensagem
		[cutscene_section_end, true, false],
		[cutscene_skip_page_other, 0, self, 0],
		[cutscene_reset],
		// Encerra a seção de mensagens	
	]	
	scene_info[4] = [
		[bubble_speech, super, global.language.chat._5.aa.oldman1, global.language.chat._5.aa.oldman1name],
		
		[cutscene_camera_change],
		// Mostra a mensagem
		[cutscene_section_end, true, false],
		// Encerra a seção de mensagens
		[cutscene_skip_page_other, 0, self, 0],
		[cutscene_reset],
	]
}
#endregion