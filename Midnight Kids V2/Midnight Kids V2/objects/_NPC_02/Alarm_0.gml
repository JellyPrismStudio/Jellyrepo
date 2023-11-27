if state_machine == -1{
	
}
if state_machine == 0{
	if variable_instance_exists(self, "path") path_delete(path);
	target_x = 400;
	target_y = 300;
	obj_speed = 0.8;
	path = path_add();
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
	alarm_set(0,10)
}
if state_machine == 1{
	if variable_instance_exists(self, "path") path_delete(path);
	target_x = 160;
	target_y = 416;
	obj_speed = 1.6;
	path = path_add();
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
	alarm_set(0,10)	
}
if state_machine == 2{
	if variable_instance_exists(self, "path") path_delete(path);
	path = path_add();
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
	alarm_set(0,10)	
}

