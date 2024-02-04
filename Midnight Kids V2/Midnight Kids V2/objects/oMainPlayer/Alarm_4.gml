if !global.on_message
{
	if variable_instance_exists(self, "path") {
		if path_exists(path) path_delete(path);	
		
		
	}
	local_look_direction(pdx, pdy)
	path = path_add();
	target_x = random_range(pdx - dist2, pdx + dist);
	target_y = random_range(pdy - dist3, pdy + dist4);
	mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
	path_start(path, pathing_speed, path_action_stop, false);
	pathing = false;
	a4 = false;
	view_range = irandom_range(vr1,vr2);
	if path_get_length(path) > 130	and path_get_length(path) < 300	pathing_speed = 4
	else if path_get_length(path) > 300								pathing_speed = 5
	else pathing_speed = 3
}