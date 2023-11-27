path_delete(path);
path = path_add();

target_x = global.player.x;
target_y = global.player.y;

mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);

path_start(path, obj_speed, path_action_stop, true);
pathing = false;

alarm_set(0,10)