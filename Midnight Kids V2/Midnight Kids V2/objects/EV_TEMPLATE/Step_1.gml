
scene_info[0] = [
	// PAGE CONFIG - Configurações de página, como trigger e qual página da cutscene tá ativa
	//* [on_trigger, self, global.player],
	//[cutscene_switched_page, 0, true, 2],
	[cutscene_start, 
	-1,				// Modo de Trigger |		0 - toque, 1 - clique, 2 - auto
	true,			// Bloquear Movimento
	true,			// Bloquear Menus e Movimento
	"",				// Texto da Popup
	"",				// Nome da Popup
	0,				// Trigger ID
	true,			// Valor que precisa estar para ir pra proxima pagina
	2,				// Proxima página
	true,			// Resetar a câmera
	global.player],	// Objeto que precisa colidir caso o Trigger seja 0 ou 1		
	
	// FINISHING				
	[cutscene_section_end],
	//[manage_follower, 1, 1, playerB],
	
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]