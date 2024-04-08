depth = -sprite_width-y+camera_get_view_y(view_camera[0]);

if (instance_exists(obj_player) and point_distance(x, y, obj_player.x, obj_player.y) < 300)
{
	desx = obj_player.x;
	desy = obj_player.y;
		
	if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
}