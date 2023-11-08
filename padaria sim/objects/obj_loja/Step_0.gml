var _view = view_camera[0];
var _wport = camera_get_view_width(_view);
var _hport = camera_get_view_height(_view);
var _xport = camera_get_view_x(_view);
var _yport = camera_get_view_y(_view);

if (mouse_wheel_up())
{
	camera_set_view_size(_view, _wport-zoom, _hport-zoom/2);
	camera_set_view_pos(_view, _xport+zoom/2, _yport+zoom/4);
}

if (mouse_wheel_down())
{
	camera_set_view_size(_view, _wport+zoom, _hport+zoom/2);
	camera_set_view_pos(_view, _xport-zoom/2, _yport-zoom/4);
}

var _col = collision_point(mouse_x, mouse_y, obj_balcao, false, false) or collision_point(mouse_x, mouse_y, obj_cliente, false, false);
var _ins = instance_exists(obj_painel) or instance_exists(obj_produtos) or instance_exists(obj_clientes) or instance_exists(obj_comidas);
if (mouse_check_button_pressed(mb_left) and !_col and !point_in_rectangle(mouse_x, mouse_y, 0, 0, 50, 100) and !_ins)
{
	movendo = true;
}

if (movendo)
{
	camera_set_view_pos(_view, _xport+mou_x-mouse_x, _yport+mou_y-mouse_y);
	if (mouse_check_button_released(mb_left)) movendo = false;
}

mou_x = mouse_x;
mou_y = mouse_y;