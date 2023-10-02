f_monstros = function()
{
	draw_set_alpha(.6);
	draw_rectangle(room_width/2-180, room_height-10, room_width/2+180, room_height-135, false);
	draw_set_alpha(.9);
	draw_sprite_ext(spr_monstro1, 0, room_width/2-110, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_sprite_ext(spr_monstro2, 0, room_width/2, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_sprite_ext(spr_monstro3, 0, room_width/2+110, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_set_alpha(1);
}

f_criatura = function(_obj)
{
	if (instance_exists(obj_criacao))
	{
		instance_create_layer(obj_criacao.x, obj_criacao.y, layer, _obj);
	}
}

f_mouse = function()
{
	if (mouse_check_button_released(mb_left) and mouse_y == clamp(mouse_y, room_height-70-48, room_height-70+48))
	{
		var _obj = noone;
		if (mouse_x == clamp(mouse_x, room_width/2-110-48, room_width/2-110+48)) _obj = obj_monstro1;
		if (mouse_x == clamp(mouse_x, room_width/2-48, room_width/2+48)) _obj = obj_monstro2;
		if (mouse_x == clamp(mouse_x, room_width/2+110-48, room_width/2+110+48)) _obj = obj_monstro3;
		
		if (_obj != noone) f_criatura(_obj);
	}
}