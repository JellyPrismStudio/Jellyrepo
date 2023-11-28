/// @description Insert description here
global.can_move = false;
global.onmenu = true;
notspawn = false;
pause_game();
str = "";
r_x = global.player.x - view_xview[0];
r_y = global.player.y - view_yview[0];
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
if !instance_exists(object_viewport) instance_create_depth(x,y,depth,object_viewport);
var bg3 = instance_create_layer(vx,vy,"Menu", menuOffBackground);
bg3.depth += 10;
// You can write your code in this editor



