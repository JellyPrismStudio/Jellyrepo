depth = -sprite_width-y+camera_get_view_y(view_camera[0]);

switch (estado)
{
	case "andando":
		var _chance = irandom(50);
		if (_chance == 1)
		{
			desx = x+irandom_range(-100, 100);
			desy = y+irandom_range(-100, 100);
		
			if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true) and path_get_length(caminho) < 300)
			{
				path_start(caminho, sped_walk, path_action_stop, false);
			}
			else mp_grid_path(obj_grid.grid, caminho, x, y, x, y, true);
		}
		
		if (point_distance(x, y, obj_player.x, obj_player.y) < 200)
		{
			desx = obj_player.x;
			desy = obj_player.y;
			mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true) estado = "perseguindo";
		}
	break;
	case "perseguindo":
		desx = obj_player.x;
		desy = obj_player.y;
		
		if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true))
		{
			path_start(caminho, sped, path_action_stop, false)
		}
		else
		{
			path_end();
			estado = "andando";
		}
		
		if (point_distance(x, y, obj_player.x, obj_player.y) > 400)
		{
			path_end();
			estado = "andando";
		}
	break;
}

/*if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < 300)
{
	desx = obj_player.x;
	desy = obj_player.y;
		
	if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true) and path_get_length(caminho) < 300)
	{
		path_start(caminho, sped, path_action_stop, false)
	}
	else mp_grid_path(obj_grid.grid, caminho, x, y, x, y, true);
}