scr_destruir("estoque");

pagina = 0;
pagina_max = 1;

f_comidas = function()
{
	for (var i = 7*pagina; i < clamp(global.itens, pagina*7, (pagina+1)*7); i++;)
	{
		var _list = ds_list_create();
		collision_rectangle_list(0, 0, room_width, room_height, obj_balcao, false, true, _list, false);
		var _tem = false
		for (var j = 0; j < ds_list_size(_list); j++;)
		{
			var _balcao = ds_list_find_value(_list, j);
			for (var k = 0; k < array_length(_balcao.comidas[0]); k++;)
			{
				if (_balcao.comidas[2, k] == i)
				{
					var _tem = true;
					break;
				}
			}
			if (_tem) break;
		}
		ds_list_clear(_list);
		ds_list_destroy(_list);
		
		var _color = c_gray;
		
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-280, 65+75*(i-floor(i/7)*7), room_width/2+235, 135+75*(i-floor(i/7)*7)))
		{
			if (mouse_check_button(mb_left)) _color = c_ltgray;
			draw_set_color(_color);
			draw_rectangle(room_width/2-290, 65+75*(i-floor(i/7)*7), room_width/2+235, 135+75*(i-floor(i/7)*7), false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and global.p_quantidade[i] > 0 and _tem)
			{
				global.p_quantidade[i]--;
				_balcao.comidas[3, k]++;
			}
		}
		
			draw_sprite_ext(spr_comidas, i, room_width/2-250, 100+75*(i-floor(i/7)*7), 4, 4, 0, c_white, 1);
		if (_tem)
		{
			draw_text(room_width/2-200, 65+75*(i-floor(i/7)*7), "quantidade nos balcoes: " + string(_balcao.comidas[3, k]));
			draw_text(room_width/2-200, 80+75*(i-floor(i/7)*7), "quantidade no estoque: " + string(global.p_quantidade[i]));
		}
	}
}