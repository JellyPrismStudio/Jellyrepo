#region PARENT EVENT
with (parEvent){
	
	
	scene_info[0] = [
		[on_trigger_priority, super, global.mainplayer],
		// Se for triggado, executa.
		[popup_on_trigger, super,super, "Conversar", "", c_white, 0, true, 0, global.player],
		// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
		[cutscene_skip_page_other,1,super, 0],
		// Esse evento pula a página do Super Event, ou seja, muda a página do "ROUTINES" de 0 pra 1
		
		[cutscene_section_start, !super._block, self.id],
		// Esse evento inicia a seção, negando outros eventos paralelos de acontecer
		[cutscene_look_direction, super],
		// Olha para o pesonagem
		[bubble_speech,super,"Essa floresta a noite é bonitinha","Stacy"],
		[bubble_speech,super,"Pena que aparecem muitos animais nojentos por aqui","Stacy"],
		[bubble_speech,super,"Acho que eu já vi uns 10 sapos e umas 8 cobras diferentes só hoje","Stacy"],
		[bubble_speech,global.player,"É, tome cuidado!",global.player_stats[global.player_index].nome, 1, 0, global.config.textcolor, c_olive],
		[bubble_speech,super,"Com certeza. Eu certamente não quero pegar nenhuma doença","Stacy"],
		// Mostra a mensagem
		[cutscene_section_end, true, false],
		// Encerra a seção de mensagens
		[cutscene_skip_page_other,0,super, 0],
		[cutscene_reset],
		// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
	]
	scene_info[1] = [
		[cutscene_goto_page,0,-1],
		// Esta página não está sendo usada
	]	
}
#endregion