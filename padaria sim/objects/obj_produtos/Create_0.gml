f_draw = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

f_array = function()
{
	for (var i = 0; i < array_length(obj.comidas[0]); i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-250+i*100-36, 100-36, room_width/2-250+i*100+36, 100+36))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+i*100-36, 100-36, room_width/2-250+i*100+36, 100+36, false);
			draw_set_color(c_white);
			if (mouse_check_button_pressed(mb_left))
			{
				for (var j = i; j < array_length(obj.comidas[0])-1; j++;)
				{	
					obj.comidas[0, j] = obj.comidas[0, j+1];
					obj.comidas[1, j] = obj.comidas[1, j+1];
					obj.comidas[2, j] = obj.comidas[2, j+1];
				}
				array_resize(obj.comidas[0], array_length(obj.comidas[0])-1);
				array_resize(obj.comidas[1], array_length(obj.comidas[1])-1);
				array_resize(obj.comidas[2], array_length(obj.comidas[2])-1);
				break;
			}
		}
		draw_sprite_ext(spr_comidas, obj.comidas[2, i], room_width/2-250+i*100, 100, 4, 4, 0, c_white, 1);
	}
}

f_hotbar = function()
{
	for (var i = 0; i < 5; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-200+i*100-32,room_height-132, room_width/2-200+i*100+32, room_height-68))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-200+i*100-36, room_height-136, room_width/2-200+i*100+36, room_height-64, false);
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
		draw_sprite_ext(spr_comidas, i, room_width/2-200+i*100, room_height-100, 4, 4, 0, c_white, 1);
	}
}

f_close = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, false);
	draw_set_color(c_white);
	if (point_in_rectangle(mouse_x, mouse_y, room_width/2+302, 50, room_width/2+322, 70))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2+305, 53, room_width/2+319, 67, false);
		draw_set_color(c_white);
		if (mouse_check_button_pressed(mb_left))
		{
			instance_destroy();
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(room_width/2+312, 60, "X")
	draw_set_valign(-1);
	draw_set_halign(-1);
}