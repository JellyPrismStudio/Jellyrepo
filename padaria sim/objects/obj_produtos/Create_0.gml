f_array = function()
{
	for (var i = 0; i < global.itens; i++;)
	{
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+(i-floor(i/5)*5)*100-36, 100-36+100*floor(i/5), room_width/2-250+(i-floor(i/5)*5)*100+36, 100+36+100*floor(i/5)))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+(i-floor(i/5)*5)*100-36, 100-36+100*floor(i/5), room_width/2-250+(i-floor(i/5)*5)*100+36, 100+36+100*floor(i/5), false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left))
			{
				if (global.p_comidas[3, i] > 0)
				{
					global.p_comidas[3, i]--;
					global.p_quantidade[global.p_comidas[2, i]]++;
				}
			}
		}
		draw_sprite_ext(spr_comidas, global.p_comidas[2, i], room_width/2-250+(i-floor(i/5)*5)*100, 100+100*floor(i/5), 4, 4, 0, c_white, 1);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+i*100+45-13, 85-13+100*floor(i/5), room_width/2-250+i*100+45+13, 85+13+100*floor(i/5)))
		{
			shader_set(shd_branco);
			if (mouse_check_button_pressed(mb_left))
			{
				global.p_comidas[1, i]++;
			}
		}
		draw_sprite_ext(spr_preco, 1, room_width/2-250+(i-floor(i/5)*5)*100+45, 85+100*floor(i/5), 4, 4, 0, c_white, 1);
		shader_reset();
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-250+i*100+45-13, 115-13+100*floor(i/5), room_width/2-250+i*100+45+13, 115+13+100*floor(i/5)))
		{
			shader_set(shd_branco);
			if (mouse_check_button_pressed(mb_left))
			{
				global.p_comidas[1, i]--;
			}
		}
		draw_sprite_ext(spr_preco, 0, room_width/2-250+(i-floor(i/5)*5)*100+45, 115+100*floor(i/5), 4, 4, 0, c_white, 1);
		shader_reset();
		draw_set_halign(fa_center);
		draw_text(room_width/2-250+(i-floor(i/5)*5)*100, 135+100*floor(i/5), "$" + string(global.p_comidas[1, i]))
		draw_set_color(c_black);
		draw_text(room_width/2-250+(i-floor(i/5)*5)*100, 100+100*floor(i/5), string(global.p_comidas[3, i]));
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
			if (mouse_check_button_pressed(mb_left) and global.p_quantidade[i] > 0)
			{
				var _nome = ["bolo", "queijo", "presunto", "pão de forma", "pão", "torta", "pastel", "panetone"];
				var _preco = [10, 7, 5, 3, 2, 8, 4, 6];
				
				for (var j = 0; j < array_length(global.p_comidas[0]); j++;)
				{
					if (_nome[i] == global.p_comidas[0, j])
					{
						global.p_comidas[3, j]++;
						global.p_quantidade[i]--;
						break;
					}
					if (j == array_length(global.p_comidas[0])-1 and array_length(global.p_comidas[0]) < obj.qtd_max)
					{
						//eu fiz esse treco assim, pq tava bugando, eu enquanto fui fazendo testes pensei q talvez assim funcionasse.... e funcionou kkkkkkkkkk
						global.p_comidas[0, array_length(obj.comidas[0])] = _nome[i];
						global.p_comidas[1, array_length(obj.comidas[0])] = _preco[i];
						global.p_comidas[2, array_length(obj.comidas[0])] = i;
						global.p_comidas[3, array_length(obj.comidas[0])] = 1;
						global.p_comidas[0, array_length(obj.comidas[0])-1] = _nome[i];
						global.p_comidas[1, array_length(obj.comidas[0])-1] = _preco[i];
						global.p_comidas[2, array_length(obj.comidas[0])-1] = i;
						global.p_comidas[3, array_length(obj.comidas[0])-1] = 1;
						global.p_quantidade[i]--;
						
						break;
					}
				}
				
				if (array_length(obj.comidas[0]) == 0)
				{
					global.p_comidas[0, 0] = _nome[i];
					global.p_comidas[1, 0] = _preco[i];
					global.p_comidas[2, 0] = i;
					global.p_comidas[3, 0] = 1;
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

f_level = function()
{
	var _preco = obj.preco/2*obj.level;
	if (point_in_rectangle(mouse_x, mouse_y, room_width/2+205, room_height-95, room_width/2+295, room_height-55))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2+205, room_height-95, room_width/2+295, room_height-55, false);
		draw_set_color(c_white);
		if (mouse_check_button_pressed(mb_left) and global.gold >= _preco and obj.level < 10)
		{
			global.gold -= _preco;
			obj.level++;
			if (obj.level/2 == floor(obj.level/2)) obj.qtd_max++;
		}
	}
	
	draw_text(room_width/2+210, room_height-95, "Level: " + string(obj.level));
	if (obj.level < 10) draw_text(room_width/2+210, room_height-80, "$" + string(_preco));
}