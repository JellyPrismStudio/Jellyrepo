	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
	target_x = random_range(global.player.x - dist2, global.player.x + dist);
	target_y = random_range(global.player.y - dist3, global.player.y + dist4);
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, 3, path_action_stop, true);
	pathing = false;
	a0 = false;