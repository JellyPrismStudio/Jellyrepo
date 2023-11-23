var _view = view_camera[0];
var _angle = camera_get_view_angle(_view);
var _moux = window_mouse_get_x();
var _winx = window_get_width()/2;
if (_moux < _winx-1) camera_set_view_angle(_view, _angle-point_distance(_moux, 0, _winx, 0)/2);
if (_moux > _winx) camera_set_view_angle(_view, _angle+point_distance(_moux, 0, _winx, 0)/2);
window_mouse_set(window_get_width()/2, window_get_height()/2);

var _angle = camera_get_view_angle(_view);
var _width = camera_get_view_width(_view);
var _height = camera_get_view_height(_view);
camera_set_view_pos(_view, x-400+lengthdir_x(432, -_angle+90), y-400+lengthdir_y(432, -_angle+90))

var _dir = noone;
if (keyboard_check(vk_up)) _dir = 90;
if (keyboard_check(vk_down)) _dir = 270;
if (keyboard_check(vk_left)) _dir = 180;
if (keyboard_check(vk_right)) _dir = 0;

if (_dir != noone)
{
	x += lengthdir_x(8, -_angle+_dir);
	y += lengthdir_y(8, -_angle+_dir);
}