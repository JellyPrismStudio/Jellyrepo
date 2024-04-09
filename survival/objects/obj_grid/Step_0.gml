/*if (mouse_check_button_pressed(mb_any))
{
	mp_grid_destroy(grid);
	cell_t = 24;
	cell_h = room_width div cell_t;
	cell_v = room_height div cell_t;
	grid = mp_grid_create(0, 0, cell_h, cell_v, cell_t, cell_t);
	mp_grid_add_instances(grid, obj_colisao, false);
}