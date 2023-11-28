#region CREATE DEFINES
	isDepthsorted = true;
	isDirectionable = false;
	// 
	DirectionableIndexes = [0,							// IDLE
							1,							// ↓
							2,							// ↑
							3,							// →
							4,							// ←
							5,							// ↓→
							6,							// ↓↑
							7,							// ↓←
							8						];	// ↓→
	//						
	
#endregion

#region CREATE (Dont touch)
	last = 0;
	scene = [0,0,0,0,0,0,0];
	scene_indexer = 0;
	timer = 0;
	state_machine = 0;
	_block = true;
	
	if isDirectionable{
		direction_create(x,y,20,false,5);
		
	}
	
	
	alarm[0] = 10;
	parEvent = instance_create_depth(x,y,depth-1,Event_TemplateNull);
	parEvent.image_xscale = xscale;
	parEvent.image_yscale = yscale;
	
	variable_instance_set(parEvent,"super",self.id);
	
#endregion

// Mostly designed for move rote and things that doesn't need interaction. Routines
#region ROUTINES

	scene_info[0] = [
		[cutscene_nothing],
		
	];

	scene_info[1] = [
		[cutscene_variable, self, "state_machine", -1],
		[cutscene_reset],
	]
#endregion

// Mostly designed for the event itself after interaction.
#region PARENT EVENT (EDITAR NO BEGIN STEP SE O PLAYER TIVER QUE RESPONDER + STEP ACTIONS)

with (parEvent){
	
	
	scene_info[0] = [
		[popup_on_trigger, super,super, "Interagir", "", c_white, 0, true, 0, global.player],
		// Primeiro evento, que exibe a popup de interagir e espera o input (vk_space)
		[cutscene_skip_page_other,1,super, 0],
		[cutscene_look_direction, super],
		// Esse evento pula a página do Super Event, ou seja, muda a página do "ROUTINES" de 0 pra 1
		[bubble_speech,super,"Olá amigo","Geresvaldo"],
		[bubble_speech,global.player,"Olá, velho senhor idoso",global.player_stats[global.player_index].nome, 1, 0, global.config.textcolor, c_olive],
		// Mostra a mensagem
		[cutscene_skip_page_other,0,super, 0],
		// Muda a página do Super Event de 1 para 0
		[cutscene_reset],
		// Reseta essa página de evento (Ou seja, volta o index para o inicio, e roda o POPUP_ON_TRIGGER de novo
		
	]
	scene_info[1] = [
		[cutscene_goto_page,0,-1],
		// Esta página não está sendo usada
	]	
}

#endregion