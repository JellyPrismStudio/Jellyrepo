/// @description Drawing And Calculating Shadow
	//Check visibility
	
	if not(instance_position(x, y, obj_uls_collider) && obj_uls_controller2.disable_inside)
	{
		Visible = true;
	}
	else
	if (Visible == true)
	{
		Visible = false;
	}

	//If Visible
	if (Visible)
	{
		//Setting up Surface
		var circle_di = light_radius*2;
		if( !surface_exists(light_surf) )
		{
			light_surf = surface_create( circle_di*1.25, circle_di*1.25);
		}
		else
		if ( surface_get_width(light_surf) < circle_di)
		{
			//surface_resize(light_surf, circle_di, circle_di);
		}

		//Start surfacing
		surface_set_target(light_surf);
		draw_clear_alpha(0,0);
	
		//Draw Light
		if (sprite_index == -1)
		{
			draw_circle_color( (surface_get_width(light_surf)*0.5), (surface_get_height(light_surf)*0.5), light_radius, c_white, c_black, false);
		}
		else
		{
			var v_spr_scale = (light_radius / max( sprite_get_height(sprite_index), sprite_get_width(sprite_index)));
			draw_sprite_ext( sprite_index, image_index, (surface_get_width(light_surf)*0.5), (surface_get_height(light_surf)*0.5), v_spr_scale, v_spr_scale, image_angle, c_white, 1);
		}

		//Erase Light
		var _list = ds_list_create();
		var _x = camera_get_view_x(view_camera[0]);
		var _y = camera_get_view_y(view_camera[0]);
		var _w = camera_get_view_width(view_camera[0]);
		var _h = camera_get_view_height(view_camera[0]);
		collision_rectangle_list(_x, _y, _x+_w, _y+_h, obj_uls_collider, false, true, _list, true);
//		for (var i = 0; i < instance_number(obj_colisao); ++i) 
//		{
//		    ds_list_add(_list, instance_find(obj_colisao, i));
//		}
		
		var _num = ds_list_size(_list);
		
		if (_num > 0)
		{
			//Start
			gpu_set_blendmode(bm_subtract);
			vertex_begin(VBuffer, VertexFormat);
		
			//Set up
			var plt, prt, prb, plb, i_find, validate_light;
			var radius_surf = (surface_get_width(light_surf)*0.5);
		
			//Iterate
			for (var i = 0; i < _num; ++i)
			{
				//Find i
				i_find = (_list[| i]);

				//Check if it is actualy in range
				var corner_size = array_length(i_find.corners);
				var i1, i2;
				
				for (var j = 0; j < corner_size; ++j) 
				{
					//Indexes
					i1 = i_find.corners[j];
					i2 = i_find.corners[((j + 1) % corner_size)];
					
				    //Sign test and cast shadow
					if( !scr_signtest( i1[0], i1[1], i2[0], i2[1], x,y) )
					{
						scr_castshadow(VBuffer, radius_surf, i1[0], i1[1], i2[0], i2[1], x,y, 400);
					}
				}
			}
		
			//Drop List

			//Ending vertex
			vertex_end(VBuffer);    
			vertex_submit(VBuffer,pr_trianglelist,-1);
		
			//Reseting blendmode
			gpu_set_blendmode(bm_normal);
		}
		
		ds_list_destroy(_list);
	
		//Close Surface
		surface_reset_target();
	}