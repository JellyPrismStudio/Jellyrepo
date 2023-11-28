if position_meeting(mouse_x,mouse_y,self) or place_meeting(mouse_x,mouse_y,self){
	if to_gamepad_pressed(mb_left){
		switch(selfswitch){
		case 1:
		global.config.GPU.wobble = !global.config.GPU.wobble;
		if global.config.GPU.wobble image_index = 0;
		else image_index = 1;
		break
		
		case 2:
		global.config.GPU.floorlight = !global.config.GPU.floorlight;
		if global.config.GPU.floorlight image_index = 0;
		else image_index = 1;
		break
		
		case 3:
		global.config.GPU.weather = !global.config.GPU.weather;
		if global.config.GPU.weather image_index = 0;
		else image_index = 1;
		
		break
		
		case 4:
		global.config.GPU.highFPS = !global.config.GPU.highFPS;
		if global.config.GPU.highFPS image_index = 0;
		else image_index = 1;
		break
		
		case 5:
		global.config.GPU.lightFX = !global.config.GPU.lightFX;
		if global.config.GPU.lightFX image_index = 0;
		else image_index = 1;
		break
			
		case 6:
		global.config.dynamiccamera = !global.config.dynamiccamera;
		if global.config.dynamiccamera image_index = 0;
		else image_index = 1;
		break
		}
		
		
		
		if global.config.GPU.floorlight == false {
			if instance_exists(obj_light_torch2)				instance_deactivate_object(obj_light_torch2);
			if instance_exists(obj_uls_collider2)				instance_deactivate_object(obj_uls_collider2);	
			if instance_exists(obj_uls_controller2)				instance_deactivate_object(obj_uls_controller2);	
			if instance_exists(obj_uls_light2nd)				instance_deactivate_object(obj_uls_light2nd);	
			if instance_exists(obj_light_lamp2)					instance_deactivate_object(obj_light_lamp2);
			if instance_exists(obj_uls_light_renderer2)			instance_deactivate_object(obj_uls_light_renderer2);
			if instance_exists(obj_uls_shadow_renderer2)		instance_deactivate_object(obj_uls_shadow_renderer2);
			if instance_exists(obj_light_bullet1)				instance_deactivate_object(obj_light_bullet1);
		}
		if global.config.GPU.floorlight == true {
							instance_activate_object(obj_light_bullet1);
							instance_activate_object(obj_light_torch2);
							instance_activate_object(obj_uls_collider2);	
							instance_activate_object(obj_uls_controller2);	
							instance_activate_object(obj_uls_light2nd);	
							instance_activate_object(obj_light_lamp2);
							instance_activate_object(obj_uls_light_renderer2);
							instance_activate_object(obj_uls_shadow_renderer2);
		}
		if global.config.GPU.weather == false {
				instance_deactivate_object(_SYS_WEATHER_RAIN);
		}
		if global.config.GPU.weather == true {
				instance_activate_object(_SYS_WEATHER_RAIN);
		}
		if global.config.GPU.lightFX == false {
			if instance_exists(obj_light_torch)					instance_deactivate_object(obj_light_torch);
			//if instance_exists(obj_uls_collider)				instance_deactivate_object(obj_uls_collider);	
			//if instance_exists(obj_uls_controller)				instance_deactivate_object(obj_uls_controller);	
			if instance_exists(obj_uls_light)					instance_deactivate_object(obj_uls_light);	
			if instance_exists(obj_light_lamp)					instance_deactivate_object(obj_light_lamp);
			//if instance_exists(obj_uls_light_renderer)			instance_deactivate_object(obj_uls_light_renderer);
			//if instance_exists(obj_uls_shadow_renderer)			instance_deactivate_object(obj_uls_shadow_renderer);
		}
		if global.config.GPU.lightFX == true {
							instance_activate_object(obj_light_torch);
							//instance_activate_object(obj_uls_collider);	
							//instance_activate_object(obj_uls_controller);	
							instance_activate_object(obj_uls_light);	
							instance_activate_object(obj_light_lamp);
							//instance_activate_object(obj_uls_light_renderer);
							//instance_activate_object(obj_uls_shadow_renderer);
		}
		config_bool = !config_bool;
	}
	
}

if config_bool image_index = 0
else image_index = 1