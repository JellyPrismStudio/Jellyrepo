pos_mouse_x = mouse_x;

f_mapa = function()
{
	if (mouse_check_button_pressed(mb_left)) pos_mouse_x = mouse_x;
	if (mouse_check_button(mb_left))
	{
		var _camera = view_camera[0];
		var _x = camera_get_view_x(_camera);
		var _y = camera_get_view_y(_camera);
		var _h = camera_get_view_width(_camera)
		camera_set_view_pos(_camera, clamp(_x-(mouse_x-pos_mouse_x), 0, room_width-_h), _y);
	}
}

f_shop = function()
{
	var _color = c_white;
	var _x = camera_get_view_x(view_camera[0]);
	if (point_in_circle(mouse_x, mouse_y, 1240+_x, 600, 32))
	{
		_color = c_gray;
		if (mouse_check_button_pressed(mb_left)) room_goto((scn_shop));
	}
	draw_sprite_ext(spr_shop, 0, 1240, 600, 1, 1, 0, _color, 1);
	
	draw_text(10, 10, string(global.gold))
}