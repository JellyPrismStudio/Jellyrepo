if state_machine == -1{
	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
	alarm_set(0,10);
}

if state_machine == 2{
	//show_message("OK");
	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
	alarm_set(0,10)	
}