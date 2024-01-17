
scene_info[0] = [
	// PAGE CONFIG - Configurações de página, como trigger e qual página da cutscene tá ativa
	//* [on_trigger, self, global.player],
	//[cutscene_switched_page, 0, true, 2],
	[cutscene_start, 
	0,			// Modo de Trigger |		0 - toque, 1 - clique, 2 - auto
	false,		// Bloquear Movimento
	false,		// Bloquear Menus
	"",			// Texto da Popup
	"",			// Nome da Popup
	0,			// Trigger ID
	true,		// Valor que precisa estar para ir pra proxima pagina
	2],			// Proxima página
	
	[cutscene_camera_change, "Ryan"],
	[bubble_speech,"Ryan",global.language.main.s0.m1,global.player_stats[1].nome, 1, 0, global.config.textcolor, c_olive],
	[cutscene_camera_change, "Hanna"],
	[bubble_speech,"Hanna","Qe foi Ria",global.player_stats[2].nome, 1, 0, global.config.textcolor, c_olive],
	[cutscene_camera_change, "Ryan"],
	[bubble_speech,"Ryan","To co do no meu subaqinho", global.player_stats[1].nome, 1, 0, global.config.textcolor, c_olive],
	[cutscene_camera_change, "Hanna"],
	[bubble_speech,"Hanna","A", global.player_stats[2].nome, 1, 0, global.config.textcolor, c_olive],
	
	// FINISHING				
	[cutscene_section_end],
	//[manage_follower, 1, 1, playerB],
	
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]