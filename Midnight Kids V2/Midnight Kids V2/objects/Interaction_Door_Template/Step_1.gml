with (parEvent){
	
	
	scene_info[0] = [
		
		[on_trigger, super, global.player],
		
		[cutscene_switched_page, "", 0, 2],
		// Se for triggado, executa.
		[cutscene_low_priority],
		
		[popup_on_trigger, super,global.player, super._interactable, "", c_white, super._yfix, true, 0, global.player, c_orange],
		// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
		[cutscene_lock_menu],
		[cutscene_variable, self, "persistente", true],
		[perform_transfer, super._room, super._xx, super._yy, global.player, true, true], // Room2, 800, 530, global.player],
		// Mostra a mensagem
		// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		[cutscene_unlock_menu],
		[cutscene_variable, self, "persistente", false],
		[cutscene_destroy_object, id],
	]
	scene_info[1] = [
		[cutscene_goto_page,0,-1],
		// Esta página não está sendo usada
	]	
}