if (instance_exists(obj_balcao))
{
	var y1 = y;
	desx = obj_balcao.x;
	desy = obj_balcao.y;
	
	if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
}