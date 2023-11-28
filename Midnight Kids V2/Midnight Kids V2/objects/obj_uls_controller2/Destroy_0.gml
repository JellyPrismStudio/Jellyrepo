/// @description Destroy All Light Related Objects

	//Destroy Each Light
	with(obj_uls_light2nd)
	{
		instance_destroy();
	}
	
	//Destroy aux
	with(obj_uls_light_renderer2)
	{
		instance_destroy();
	}
	with(obj_uls_shadow_renderer2)
	{
		instance_destroy();
	}