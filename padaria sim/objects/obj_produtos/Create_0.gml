qtd_max = 2;

f_array = function()
{
	for (var i = 0; i < array_length(obj.comidas[0]); i++;)
	{
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+i*100-36, 100-36, room_width/2-250+i*100+36, 100+36))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+i*100-36, 100-36, room_width/2-250+i*100+36, 100+36, false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj.comidas[3, i] > 0)
				{
					obj.comidas[3, i]--;
					global.p_quantidade[obj.comidas[2, i]]++;
				}
				else
				{
					for (var j = i; j < array_length(obj.comidas[0])-1; j++;)
					{	
						obj.comidas[0, j] = obj.comidas[0, j+1];
						obj.comidas[1, j] = obj.comidas[1, j+1];
						obj.comidas[2, j] = obj.comidas[2, j+1];
						obj.comidas[3, j] = obj.comidas[3, j+1];
					}
					array_resize(obj.comidas[0], array_length(obj.comidas[0])-1);
					array_resize(obj.comidas[1], array_length(obj.comidas[1])-1);
					array_resize(obj.comidas[2], array_length(obj.comidas[2])-1);
					break;
				}
			}
		}
		draw_sprite_ext(spr_comidas, obj.comidas[2, i], room_width/2-250+i*100, 100, 4, 4, 0, c_white, 1);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+i*100+45-13, 85-13, room_width/2-250+i*100+45+13, 85+13))
		{
			shader_set(shd_branco);
			if (mouse_check_button_pressed(mb_left))
			{
				obj.comidas[1, i]++;
			}
		}
		draw_sprite_ext(spr_preco, 1, room_width/2-250+i*100+45, 85, 4, 4, 0, c_white, 1);
		shader_reset();
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+i*100+45-13, 115-13, room_width/2-250+i*100+45+13, 115+13))
		{
			shader_set(shd_branco);
			if (mouse_check_button_pressed(mb_left))
			{
				obj.comidas[1, i]--;
			}
		}
		draw_sprite_ext(spr_preco, 0, room_width/2-250+i*100+45, 115, 4, 4, 0, c_white, 1);
		shader_reset();
		draw_set_halign(fa_center);
		draw_text(room_width/2-250+i*100, 135, "$" + string(obj.comidas[1, i]))
		draw_set_color(c_black);
		draw_text(room_width/2-250+i*100, 100, string(obj.comidas[3, i]));
		draw_set_color(c_white);
		draw_set_halign(-1);
	}
}

f_hotbar = function()
{
	for (var i = 0; i < global.itens; i++;)
	{
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-200+(i-floor(i/5)*5)*100-32, room_height-180+80*floor(i/5)-32, room_width/2-200+(i-floor(i/5)*5)*100+32, room_height-180+80*floor(i/5)+32))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-200+(i-floor(i/5)*5)*100-36, room_height-180+80*floor(i/5)-36, room_width/2-200+(i-floor(i/5)*5)*100+36, room_height-180+80*floor(i/5)+36, false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left) and array_length(obj.comidas[0]) <= qtd_max and global.p_quantidade[i] > 0)
			{
				var _nome = ["bolo", "queijo", "presunto", "pão de forma", "pão", "torta", "pastel"];
				var _preco = [10, 7, 5, 3, 2, 8, 4];
				
				for (var j = 0; j < array_length(obj.comidas[0]); j++;)
				{
					if (_nome[i] == obj.comidas[0, j])
					{
						obj.comidas[3, j]++;
						global.p_quantidade[i]--;
						break;
					}
					if (j == array_length(obj.comidas[0])-1 and array_length(obj.comidas[0]) < qtd_max)
					{
						//eu fiz esse treco assim, pq tava bugando, eu enquanto fui fazendo testes pensei q talvez assim funcionasse.... e funcionou kkkkkkkkkk
						obj.comidas[0, array_length(obj.comidas[0])] = _nome[i];
						obj.comidas[1, array_length(obj.comidas[0])] = _preco[i];
						obj.comidas[2, array_length(obj.comidas[0])] = i;
						obj.comidas[3, array_length(obj.comidas[0])] = 1;
						obj.comidas[0, array_length(obj.comidas[0])-1] = _nome[i];
						obj.comidas[1, array_length(obj.comidas[0])-1] = _preco[i];
						obj.comidas[2, array_length(obj.comidas[0])-1] = i;
						obj.comidas[3, array_length(obj.comidas[0])-1] = 1;
						global.p_quantidade[i]--;
						
						break;
					}
				}
				
				if (array_length(obj.comidas[0]) == 0)
				{
					obj.comidas[0, 0] = _nome[i];
					obj.comidas[1, 0] = _preco[i];
					obj.comidas[2, 0] = i;
					obj.comidas[3, 0] = 1;
				}
			}
		}
		draw_sprite_ext(spr_comidas, i, room_width/2-200+(i-floor(i/5)*5)*100, room_height-180+80*floor(i/5), 4, 4, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_black);
		draw_text(room_width/2-200+(i-floor(i/5)*5)*100, room_height-180+80*floor(i/5), string(global.p_quantidade[i]));
		draw_set_color(c_white);
		draw_set_valign(-1);
		draw_set_halign(-1);
	}
}