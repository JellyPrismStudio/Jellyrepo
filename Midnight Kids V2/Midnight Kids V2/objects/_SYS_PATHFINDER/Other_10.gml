/*	path_delete(path);
	path = path_add();

	target_x = global.player.x;
	target_y = global.player.y;

	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	show_debug_message(obj_speed);
	path_start(path, obj_speed, path_action_stop, true);