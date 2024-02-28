var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);
if (timer <= 250) draw_healthbar(_x+_w/3, _y+_h/2-20, _x+_w/1.5, _y+_h/2+20, timer/2.5, c_black, c_lime, c_lime, 0, true, true);

if (timer > 0 and timer/10 == floor(timer/10))
{
	surface_free(surf_dirt);
}