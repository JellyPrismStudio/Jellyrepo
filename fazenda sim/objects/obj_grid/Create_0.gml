cell_t = 24;
cell_h = room_width div cell_t;
cell_v = room_height div cell_t;
grid = mp_grid_create(-cell_t, -cell_t, cell_h+cell_t*2, cell_v+cell_t*2, cell_t, cell_t);
mp_grid_add_instances(grid, obj_colisao, false);