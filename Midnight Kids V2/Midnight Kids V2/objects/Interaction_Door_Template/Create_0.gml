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
	scene_indexer = 0;
	timer = 0;
	
	if isDirectionable{
		direction_create(x,y,20,false,5);
		
	}
	
	
	parEvent = instance_create_depth(x,y,depth-1,Event_TemplateNull);
	parEvent.image_xscale = xscale * self.image_xscale;
	parEvent.image_yscale = yscale * self.image_yscale;
	parEvent.image_blend = c_purple;
	//parEvent.visible = false;
	variable_instance_set(parEvent,"super",self.id);
	
#endregion

// Mostly designed for move rote and things that doesn't need interaction. Routines
#region ROUTINES

	scene_info[0] = [
		[cutscene_nothing],
		
	];

	scene_info[1] = [
		[cutscene_reset],
	]
#endregion
if !intern var door = instance_create_depth(x + intern_x,y + intern_y,depth,DoorInteraction);
else
{
	var door = instance_create_depth(x + intern_x,y + intern_y,depth,Interaction);
	door.image_blend = c_blue;
}
// Mostly designed for the event itself after interaction.
#region PARENT EVENT

#endregion