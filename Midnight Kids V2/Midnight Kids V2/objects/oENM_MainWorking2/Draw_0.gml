enemies_draw();
if global.debug.debugshow draw_circle_color(x,y,BATTLE_RANGE, c_orange, c_white, true);
if global.debug.debugshow draw_circle_color(x,y,BATTLE_ATACK, c_orange, c_white, true);
if global.debug.debugshow and path_exists(path) draw_path(path, x, y, 1);
///