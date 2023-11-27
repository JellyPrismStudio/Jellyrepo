	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
	target_x = random_range(global.party.playersobj[_arr - 1].x - dist2, global.party.playersobj[_arr - 1].x + dist);
	target_y = random_range(global.party.playersobj[_arr - 1].y - dist3, global.party.playersobj[_arr - 1].y + dist4);
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, 3, path_action_stop, true);
	pathing = false;
	a0 = false;
	view_range = irandom_range(80,140);