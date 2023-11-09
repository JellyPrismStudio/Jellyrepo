f_draw = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

f_comidas = function()
{
	for (var i = 0; i < global.itens; i++;)
	{
		var _color = c_gray;
		
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-280, 65+75*i, room_width/2+280, 135+75*i))
		{
			if (mouse_check_button(mb_left)) _color = c_ltgray;
			draw_set_color(_color);
			draw_rectangle(room_width/2-290, 65+75*i, room_width/2+290, 135+75*i, false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and global.gold >= global.p_preco[i])
			{
				global.gold -= global.p_preco[i];
				global.p_quantidade[i]++;
			}
		}
		
		draw_sprite_ext(spr_comidas, i, room_width/2-250, 100+75*i, 4, 4, 0, c_white, 1);
		draw_text(room_width/2-200, 65+75*i, "dinheiro arrecadado: " + string(global.p_dinheiro[i]))
		draw_text(room_width/2-200, 80+75*i, "vezes comprado: " + string(global.p_compras[i]))
		draw_text(room_width/2-200, 95+75*i, "quantidade: " + string(global.p_quantidade[i]))
		draw_text(room_width/2-200, 110+75*i, "preco: $" + string(global.p_preco[i]))
	}
}

f_close = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, false);
	draw_set_color(c_white);
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2+302, 50, room_width/2+322, 70))
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