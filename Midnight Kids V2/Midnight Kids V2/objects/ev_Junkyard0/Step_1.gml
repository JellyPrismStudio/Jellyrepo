if live_call() return live_result;

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
	
	[cutscene_change_coordinates, "Hanna", 455, 490],
	[cutscene_change_coordinates, "Ryan", 400, 490],
	[cutscene_orbital_camera, "Hanna", 0, -130],
	
	
	// Players sobem
	[cutscene_move_length_parallel, "up", 1, 270, sPlayer3, sPlayer3, "Ryan"],	
	[cutscene_move_length, "up", 0.8, 250, sPlayer2, sPlayer2Walking, "Hanna", -1],
	[cutscene_move_length, "right", 0.8, 50, sPlayer2, sPlayer2Walking, "Hanna", 1],
	[cutscene_wait, 1],	
	
	[balloon,balloon_exclamacao, "Ryan", true],
	[cutscene_look_direction,  "Hanna", "L"],
	[cutscene_speech, "Ryan", global.language.main.junkyard.r0_1],
	
	
	// Personagens veem que está trancado
	
	[balloon,balloon_Duvida, "Hanna", true],	
	[cutscene_speech, "Hanna",global.language.main.junkyard.h1],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r1_1],
	[cutscene_speech, "Hanna",global.language.main.junkyard.h1_2],
	
	// Ryan acha a solução
	[cutscene_look_direction, "Ryan", "L"],
	[cutscene_wait, 70],
	[cutscene_look_direction, "Ryan", "R"],
	[cutscene_wait, 70],
	[cutscene_look_direction, "Ryan", "L"],
	[cutscene_wait, 70],
	[balloon, balloon_exclamacao, "Ryan", true],
	[cutscene_look_direction, "Ryan", "R"],
	[cutscene_wait, 70],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r2],
	
	// Ryan pula a cerca
	[cutscene_orbital_camera, "Ryan", 0, -30],
	[cutscene_move_length, "left", 1, 150, sPlayer3, sPlayer3, "Ryan"],
	[balloon, balloon_Duvida, "Hanna", true],
	[cutscene_move_length, "up", 10, 100, sPlayer3, sPlayer3, "Ryan"],
	[cutscene_wait, 30],
	[cutscene_move_length, "up", 10, 100, sPlayer3, sPlayer3, "Ryan"],
	[cutscene_wait, 30],
	[cutscene_move_length, "up", 10, 100, sPlayer3, sPlayer3, "Ryan"],
	[cutscene_move_length, "right", 10, 120, sPlayer3, sPlayer3, "Ryan"],
	[cutscene_move_length, "down", 10, 250, sPlayer3, sPlayer3, "Ryan"],
	
	// Hanna se nega a subir
	[balloon,balloon_exclamacao, "Hanna", true],
	[cutscene_move_length, "left", 1, 100, sPlayer2, sPlayer2Walking, "Hanna"],
	[cutscene_look_direction,  "Hanna", "L"],
	[cutscene_speech, "Hanna",global.language.main.junkyard.h3],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r3_1],
	[cutscene_speech, "Hanna",global.language.main.junkyard.h3_2],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r3_3],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r3_4],
	
	// Hanna pensativa 1
	[balloon, balloon_waiting, "Hanna", true, 0, true],
	[cutscene_wait, 70],
	[cutscene_look_direction,  "Hanna", "L"],
	[cutscene_wait, 70],
	[cutscene_look_direction,  "Hanna", "R"],
	[cutscene_wait, 70],
	[cutscene_look_direction,  "Hanna", "L"],
	[cutscene_wait, 30],
	[cutscene_speech, "Hanna",global.language.main.junkyard.h3_5],
	[cutscene_speech, "Ryan",global.language.main.junkyard.r3_6],
	[cutscene_speech, "Hanna",global.language.main.junkyard.h3_7],
	[cutscene_wait, 70],
	
	// Hanna pensativa 2
	[cutscene_move_length, "right", 1, 100, sPlayer2, sPlayer2Walking, "Hanna"],
	[cutscene_look_direction,  "Hanna", "R"],
	[balloon, balloon_waiting, "Hanna", true],
	[cutscene_wait, 120],
	[cutscene_move_length, "left", 1, 100, sPlayer2, sPlayer2Walking, "Hanna"],
	[cutscene_look_direction,  "Hanna", "L"],
	[cutscene_wait, 60],
	
	[cutscene_speech, "Hanna",global.language.main.junkyard.h3_8],
	
	//[cutscene_object_fade, "out", 0.2],
	
	
	// FINISHING				
	[cutscene_section_end],
	
	[perform_transfer, RoomDebug, 300, 300, global.player],
	
	//[cutscene_lock_menu],
	// Mostra a mensagem
	[cutscene_reset],
	// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
]