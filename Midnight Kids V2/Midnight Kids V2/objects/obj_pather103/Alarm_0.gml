if state_machine == "" {
	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
}
if state_machine == "ON_RANGE" {
	path_delete(path);
	path = path_add();
	target_x = global.player.x;
	target_y = global.player.y;
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
}
if state_machine == "WALKING" {
	path_delete(path);
	path = path_add();
	target_x = random_range(x - BATTLE_RANGE, x + BATTLE_RANGE);
	target_y = random_range(y - BATTLE_RANGE, y + BATTLE_RANGE);
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
}