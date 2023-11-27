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
	image_speed = 0;
	
#endregion

#region CREATE (Dont touch)
	scene = [0,0,0,0,0,0,0];
	// Aqui eu instancio em qual posição as páginas devem começar (e salvo elas)
	
	scene_indexer = 0;
	// Scene_indexer é a page
	
	timer = 0;
	
	if isDirectionable{
		direction_create(x,y,20,false,5);
		
	}
	
	
	parEvent = instance_create_depth(x,y,depth-1,Event_TemplateNull);
	parEvent.image_xscale = xscale * self.image_xscale;
	parEvent.image_yscale = yscale * self.image_yscale;
	//parEvent.visible = false;
	variable_instance_set(parEvent,"super",self.id);
	
#endregion

#region ROUTINES
	// Rotina/Eventos do Objeto em si, e não do parEvent (que é geralmente a hitbox).
	scene_info[0] = [
		[cutscene_nothing],
		
	];

	scene_info[1] = [
		[cutscene_reset],
	]
#endregion

if !secret insp = instance_create_depth(x,y,depth,Interaction)