var _view = view_camera[0];
var _angle = camera_get_view_angle(_view);
if (keyboard_check_pressed(vk_left)) camera_set_view_angle(_view, _angle+22.5);
if (keyboard_check_pressed(vk_right)) camera_set_view_angle(_view, _angle-22.5);