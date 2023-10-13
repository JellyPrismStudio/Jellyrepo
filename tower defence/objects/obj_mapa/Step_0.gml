if (keyboard_check_pressed(vk_up)) global.fase++;
if (keyboard_check_pressed(vk_down)) global.fase--;

if (mouse_check_button_pressed(mb_left)) pos_mouse_x = mouse_x;
if (mouse_check_button(mb_left))
{
	var _camera = view_camera[0];
	var _x = camera_get_view_x(_camera);
	var _y = camera_get_view_y(_camera);
	var _h = camera_get_view_width(_camera)
	camera_set_view_pos(_camera, clamp(_x-(mouse_x-pos_mouse_x), 0, room_width-_h), _y);
}