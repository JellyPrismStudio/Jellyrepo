if instance_exists(parEvent){	
	with(parEvent){
		// Tudo o que está sendo executado aqui, é executado no parEvent, que atualmente
		// é o Event_TemplateNull
		
		_player = global.player;
		_pnome = global.player_stats[global.player.self_index].nome;
		// Variáveis de config, não mexer.
		
		if super._object == "global.player" // Verifica se é relativo ao global.player. Não mudar.
		{
			scene_info[0] = [
				// PAGE CONFIG - Configurações de página, como trigger e qual página da cutscene tá ativa
				[on_trigger, super, global.player],
				// Se for triggado ao contato, executa. Serve para manter o próximo step intacto até ser colidido
				[cutscene_switched_page, "Open the Gate", true, 2],
				// Muda de página se o trigger id/name(arg1) tiver um value igual ao arg2, se sim, pula pra pagina arg3. 
				// Deixe o trigger = "" ou "none" caso nao queira pular paginas
				
				
				// SECTION CONFIGS - Configuração de seção, se vai aparecer a popup de interagir, e se vai ativar o section
				[popup_on_trigger, super,super, super._interactable, "", c_white, 0, true, 0, global.player],
				// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
				[cutscene_section_start, !super._block],
				
				
				// CUSTOMIZATION - Adicione conteudo aqui nessa sessão. 
				[bubble_speech,global.player,super._text,_pnome, 1, 0, global.config.textcolor, c_olive],
				// Foi definido o _player e o _player.nome só pq quero usar o nome do player. Poderia ser utilizado o super._name (com under)
				// Pois essa variável é definida na criação do objeto.
				[trigger_change, 0, true],
				// Ativa o trigger
				
				
				// FINISHING				
				[cutscene_section_end],
				// Mostra a mensagem
				[cutscene_reset],
				// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
			]
			scene_info[1] = [
				[cutscene_goto_page,0,-1],
				// Esta página não está sendo usada
			]
			scene_info[2] = [
				// PAGE CONFIG
				[on_trigger, super, global.player],
				[popup_on_trigger, super,super, super._interactable, "", c_white, 0, true, 0, global.player],
				[cutscene_section_start, !super._block],
				[bubble_speech,global.player,"É isso",_pnome, 1, 0, global.config.textcolor, c_olive],
				[cutscene_section_end],
				[cutscene_reset],
				// Esta página não está sendo usada
			]
		}
		else
		{
			scene_info[0] = [
				[on_trigger, super, global.player],
				// Se for triggado, executa.
				[popup_on_trigger, super,super, super._interactable, "", c_white, 0, true, 0, global.player],
				// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
				[cutscene_section_start, !super._block],
				[bubble_speech,super._object,super._text,super._name, 1, 0, global.config.textcolor, c_olive],
				//Foi definido o _player e o _player.nome só pq quero usar o nome do player. Poderia ser utilizado o super._name (com under)
				//Pois essa variável é definida na criação do objeto.
				[cutscene_section_end],
				// Mostra a mensagem
				[cutscene_reset],
				// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
			]
			scene_info[1] = [
				[cutscene_goto_page,0,-1],
				// Esta página não está sendo usada
			]
		}
	x = super.x;
	y = super.y;
	}
}
