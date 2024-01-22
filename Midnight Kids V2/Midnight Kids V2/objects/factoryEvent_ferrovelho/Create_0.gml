event_inherited();

spriteIdle = sPlayer2;
spriteWalk = sPlayer2Walking;

scene_info[0] = [
	[cutscene_switched_page, 1, true, 2],
	[cutscene_section_start, true, true],
	
	[cutscene_wait, 120],
	[cutscene_change_graphic, playerB, spriteWalk, 1],
	[cutscene_move_anim, "right", 1, 85, spriteIdle,spriteWalk, 1, true, playerB],
	[cutscene_change_graphic, playerB, spriteIdle],
	[cutscene_look_direction, playerB, -1],
	
	[cutscene_wait, 120],
	[cutscene_camera_change, playerHanna],
	[balloon, balloon_waiting, playerHanna, true, 0, true],
	[cutscene_wait, 60],
	
	[bubble_speech,"Hanna", "E agora?", "Hanna"],
	[bubble_speech,"Hanna", "temos que procurar em outro lugar pelo visto...", "Hanna"],
	
	[cutscene_camera_change, playerB],
	[balloon, balloon_waiting, playerB, true, 0, true],
	[cutscene_wait, 60],
	[cutscene_look_direction, playerB, 1],
	[cutscene_wait, 30],
	[cutscene_look_direction, playerB, -1],
	[cutscene_wait, 30],
	[cutscene_look_direction, playerB, 1],
	[cutscene_wait, 30],
	[cutscene_look_direction, playerB, -1],
	[cutscene_wait, 30],
	
	[bubble_speech, playerB, "siga meus passos", "Ryan"],
	[bubble_speech, playerB, "e cuidado pra não se machucar", "Ryan"],
	
	[cutscene_move_anim, "down", 1, 110, spriteIdle, spriteWalk, -1, true, playerB],
	[cutscene_move_anim, "down", 1, 60, spriteIdle, spriteWalk, 1, true, playerHanna],
	
	[bubble_speech, playerB, "*animação incrivel dele pulando a cerca*", "Ryan"],
	
	[cutscene_camera_change, playerHanna],
	[cutscene_wait, 30],
	[balloon, balloon_warning, playerHanna, true, 0, true],
	[cutscene_wait, 60],
	[bubble_speech,"Hanna", "Eu não vou fazer isso!", "Hanna"],
	[bubble_speech,"Hanna", "sem chance!", "Hanna"],
	[bubble_speech,"Hanna", "Eu não quero me machucar e nem ficar presa aí dentro!", "Hanna"],
	[bubble_speech,"Hanna", "Nananinanão!", "Hanna"],
	[cutscene_section_start, false, true],
	
	[cutscene_camera_change, playerB],
	[cutscene_look_direction, playerB, "left"],
	[cutscene_move_anim, "left", 1, 100, spriteIdle, spriteWalk, -1, true, playerB],
	[cutscene_wait, 20],
	[cutscene_look_direction, playerB, 1],
	[bubble_speech, playerB, "*animação incrivel dele abrindo a cerca*", "Ryan"],
	[cutscene_wait, 60],
	[cutscene_camera_change, playerHanna],
	[cutscene_move_anim, "down", 1, 50, spriteIdle, spriteWalk, 1, true, playerHanna],
	[bubble_speech,"Hanna", "Se pegarem a gente estaremos encrencados.", "Hanna"],
	[bubble_speech,"Hanna", "Meus pais vão me matar!", "Hanna"],
	[bubble_speech,"Hanna", "Vamos achar essa tal bateria logo e sair daqui!", "Hanna"],
	[cutscene_camera_change, playerB],
	[cutscene_move_anim, "down", 1, 100, spriteIdle, spriteWalk, -1, true, playerB],
	[cutscene_move_anim, "down", 1, 100, spriteIdle, spriteWalk, -1, true, playerHanna],
	
	[balloon, balloon_exclamacao, playerB, true, 0, true],
	[bubble_speech, playerB, "catapimbas, como esse Maverick é lindo!", "Ryan"],
	[bubble_speech, playerB, "Um dia ainda terei um assim, pode apostar!", "Ryan"],
	[cutscene_camera_change, playerHanna],
	[cutscene_wait, 30],
	[bubble_speech,"Hanna", "Será que é possível \"arrumar\" algum desses carros aqui?", "Hanna"],
	[bubble_speech,"Hanna", "quem sabe eu aprendo a dirigir com um deles haha", "Hanna"],
]
