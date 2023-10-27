f_draw = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-150, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-150, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

f_array = function()
{
	for (var i = 0; i < array_length(obj.comidas[0]); i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-75+i*75-36, 100-36, room_width/2-75+i*75+36, 100+36))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-75+i*75-36, 100-36, room_width/2-75+i*75+36, 100+36, false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left))
			{
				//código d tirar a comida do array
				//ainda em andamento
			}
		}
		draw_sprite_ext(spr_comidas, obj.comidas[2, i], room_width/2-75+i*75, 100, 4, 4, 0, c_white, 1);
	}
}

f_hotbar = function()
{
	for (var i = 0; i < 5; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-75+i*75-32,room_height-132, room_width/2-75+i*75+32, room_height-68))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-75+i*75-36, room_height-136, room_width/2-75+i*75+36, room_height-64, false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left))
			{
				//eu fiz esse treco assim, pq tava bugando, eu enquanto fui fazendo testes pensei q talvez assim funcionasse.... e funcionou kkkkkkkkkk
				var _nome = ["bolo", "queijo", "presunto", "pão de forma", "pão"];
				var _preco = [10, 7, 5, 3, 2];
				obj.comidas[0, array_length(obj.comidas[0])] = _nome[i];
				obj.comidas[1, array_length(obj.comidas[0])] = _preco[i];
				obj.comidas[2, array_length(obj.comidas[0])] = i;
				obj.comidas[0, array_length(obj.comidas[0])-1] = _nome[i];
				obj.comidas[1, array_length(obj.comidas[0])-1] = _preco[i];
				obj.comidas[2, array_length(obj.comidas[0])-1] = i;
			}
		}
		draw_sprite_ext(spr_comidas, i, room_width/2-75+i*75, room_height-100, 4, 4, 0, c_white, 1);
	}
}