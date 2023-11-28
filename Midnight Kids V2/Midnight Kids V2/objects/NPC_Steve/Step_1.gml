#region PARENT EVENT
with (parEvent){
	
	
	scene_info[0] = [
		[on_trigger_priority, super, global.mainplayer],
		// Se for triggado, executa.
		[popup_on_trigger, super, super, global.language.chat._interact._2, "", c_white, +20, true, 0, global.player],
		// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
		[cutscene_skip_page_other,1,super, 0],
		// Esse evento pula a página do Super Event, ou seja, muda a página do "ROUTINES" de 0 pra 1
		
		[cutscene_section_start, !super._block, self.id],
		// Esse evento inicia a seção, negando outros eventos paralelos de acontecer
		[cutscene_look_direction, super],
		[cutscene_look_direction, global.player, super, false],
		// Olha para o pesonagem
		[cutscene_camera_change, super],
	
		//[bubble_speech,super,global.language.chat.npc.steve1,global.language.chat.npc.steve1name],
		[bubble_speech_choices,super,global.language.chat.npc.steve1,global.language.chat.npc.steve1name,2,3,global.language.shop.sell,global.language.shop.buy],
		//[instanciate_choices, global.language.shop.sell, global.language.shop.buy, "", 2, 3, noone],
		//[bubble_speech_party,global.player,global.language.chat._6,global.player_stats[global.player_index].nome, 1, 0, global.config.textcolor, c_olive],
		//[cutscene_camera_change],
		// Mostra a mensagem
		//[cutscene_section_end, true, false],
		// Encerra a seção de mensagens
		[cutscene_skip_page_other,0,super, 0],
		[cutscene_reset],
		// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
	]
	scene_info[1] = [
		[cutscene_goto_page,0,-1],
		// Esta página não está sendo usada
	]
	scene_info[2] = [
		[call_shop, 1],
		//[cutscene_instanciate_object, x, y, depth, sceneShop],
		[bubble_speech,super,global.language.chat.npc.steve3,global.language.chat.npc.steve1name],
		//[cutscene_move_path, 1015, 275, 2, 0, super],
		[cutscene_camera_change],
		[cutscene_section_end, true, false],
		[cutscene_skip_page_other,0,self, 0],
		[cutscene_reset],
		// Esta página não está sendo usada
	]
	scene_info[3] = [
		[call_shop, 0],
		//[cutscene_instanciate_object, x, y, depth, sceneShopSell],
		[bubble_speech,super,global.language.chat.npc.steve2,global.language.chat.npc.steve1name],
		//[cutscene_move_path, 366, 361, 2, 0, super],
		//[cutscene_move_path, 1015, 275, 2, 0, super],
		[cutscene_camera_change],
		[cutscene_section_end, true, false],
		[cutscene_skip_page_other,0,self, 0],
		[cutscene_reset],
		// Esta página não está sendo usada
	]
}
#endregion