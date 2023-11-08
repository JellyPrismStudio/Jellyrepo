draw_text(room_width-100, 20, "xp: " + string(global.xp));
draw_text(room_width-100, 40, "level: " + string(global.level));
draw_text(room_width-100, 60, "gold: " + string(global.gold));

if (global.xp >= level[lvl]*10)
{
	global.level++;
	lvl++;
	if (global.itens < 7) global.itens++;
}

var _color = c_white;
if (point_in_circle(mouse_x-camera_get_view_x(view_camera[0]), mouse_y-camera_get_view_y(view_camera[0]), 50, 50, 24)) _color = c_gray;
draw_sprite_ext(spr_clientes, 0, 50, 50, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_clientes);
}

var _color = c_white;
if (point_in_circle(mouse_x-camera_get_view_x(view_camera[0]), mouse_y-camera_get_view_y(view_camera[0]), 50, 100, 24)) _color = c_gray;
draw_sprite_ext(spr_produtos, 0, 50, 100, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_comidas);
}