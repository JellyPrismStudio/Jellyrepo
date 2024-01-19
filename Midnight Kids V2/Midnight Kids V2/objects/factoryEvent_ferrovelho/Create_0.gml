/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



// Inherit the parent event
event_inherited();

spriteIdle = sPlayer2;
spriteWalk = sPlayer2Walking;

scene_info[0] = [
	[cutscene_switched_page, 1, true, 2],
	[cutscene_section_start, true, true],
	
	[cutscene_change_graphic, global.player,spriteWalk, 1],
	[cutscene_move_anim,"right", 1, 85,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_change_graphic, global.player,spriteIdle],
	[cutscene_look_direction,global.player,-1],
	
	[cutscene_wait, 120],
	[balloon, balloon_waiting, playerHanna, true, 0, true],
	[cutscene_wait, 60],
	
	[bubble_speech,"Hanna", "E agora?", "Hanna"],
	[bubble_speech,"Hanna", "temos que procurar em outro lugar pelo visto...", "Hanna"],
	
	[cutscene_wait, 60],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 30],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 30],
	[cutscene_look_direction,global.player,1],
	[cutscene_wait, 30],
	[cutscene_look_direction,global.player,-1],
	[cutscene_wait, 30],
	
	[bubble_speech,global.player, "siga meus passos, e cuidado\npra não se machucar", "Ryan"],
	
	[cutscene_move_anim, "down", 1, 100,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_move_anim, "down", 1, 60,spriteIdle,spriteWalk, 1, true, playerHanna],
	
	[bubble_speech,global.player, "*animação incrivel dele pulando a cerca*", "Ryan"],
	
	[cutscene_wait, 30],
	[balloon, balloon_exclamacao, playerHanna, true, 0, true],
	[cutscene_wait, 60],
	[bubble_speech,"Hanna", "Eu não vou fazer isso!", "Hanna"],
	[bubble_speech,"Hanna", "sem chance!", "Hanna"],
	[bubble_speech,"Hanna", "Eu não quero me machucar e nem ficarpresa aí dentro!", "Hanna"],
	[bubble_speech,"Hanna", "Nananinanão!", "Hanna"],
	[cutscene_section_start, false, true],
	
	[cutscene_look_direction,global.player, "left"],
	[cutscene_move_anim, "left", 1, 100,spriteIdle,spriteWalk, 1, true, global.player],
	[cutscene_wait, 20],
	[cutscene_look_direction,global.player, "right"],
	[cutscene_move_anim, "down", 1, 60,spriteIdle,spriteWalk, 1, true, playerHanna],
	[bubble_speech,"Hanna", "Se pegarem a gente estaremos encrencados.", "Hanna"],
	[bubble_speech,"Hanna", "Meus pais vão me matar!", "Hanna"],
	[bubble_speech,"Hanna", "Vamos achar essa tal bateria logo e sair daqui!", "Hanna"],
]
