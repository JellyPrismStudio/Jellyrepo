draw_sprite_ext(spr_slot, 0, x, y-100, 1.5, 1.5, 0, c_white, 1);
if (point_in_rectangle(mouse_x, mouse_y, x-16, y-116, x+16, y-84))
{
	draw_set_color(c_gray);
	draw_rectangle(x-20, y-120, x+20, y-80, false);
	draw_set_color(c_white);
	if (mouse_check_button_pressed(mb_left) and (global.mouse[0] == spr_animais and global.mouse[1] != 0 or global.mouse[0] == noone))
	{
		if (global.mouse[1] != inventario[1])
		{
			var _spr = inventario[0];
			var _sub = inventario[1];
			var _qtd = inventario[2];
			inventario[0] = global.mouse[0];
			inventario[1] = global.mouse[1];
			inventario[2] = global.mouse[2];
			global.mouse[0] = _spr;
			global.mouse[1] = _sub;
			global.mouse[2] = _qtd;
			
			for (var i = 0; i < ds_list_size(lista); i++;)
			{
				instance_destroy(ds_list_find_value(lista, i));
			}
			ds_list_clear(lista)
			for (var i = 0; i < inventario[2]; i++;)
			{
				var _obj;
				if (inventario[1] == 1) _obj = obj_porco;
				if (inventario[1] == 2) _obj = obj_galinha;
				if (inventario[1] == 3) _obj = obj_vaca;
				var _obj = instance_create_depth(x, y, depth, _obj);
				ds_list_add(lista, _obj);
				_obj.casa = self;
			}
		}
		else
		{
			inventario[2] += global.mouse[2];
			global.mouse[0] = noone;
			global.mouse[1] = 0;
			global.mouse[2] = 0;
		}
	}
}
if (inventario[0] != noone)
{
	draw_sprite_ext(inventario[0], inventario[1], x, y-100, 2, 2, 0, c_white, 1);
	draw_text(x+13, y-100, string(inventario[2]));
}