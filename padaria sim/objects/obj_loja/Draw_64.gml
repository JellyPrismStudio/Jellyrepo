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
if (point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 50, 50, 24)) _color = c_gray;
draw_sprite_ext(spr_menu_clientes, 0, 50, 50, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_clientes);
}

var _color = c_white;
if (point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 50, 100, 24)) _color = c_gray;
draw_sprite_ext(spr_menu_produtos, 0, 50, 100, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_comidas);
}

var _color = c_white;
if (point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 50, 150, 24)) _color = c_gray;
draw_sprite_ext(spr_menu_balcao, 0, 50, 150, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_balcoes);
}

var _color = c_white;
if (point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 50, 200, 24)) _color = c_gray;
draw_sprite_ext(spr_menu_estoque, 0, 50, 200, 1.5, 1.5, 0, _color, 1);
if (_color == c_gray and mouse_check_button_pressed(mb_left))
{
	instance_create_depth(0, 0, 0, obj_estoque);
}