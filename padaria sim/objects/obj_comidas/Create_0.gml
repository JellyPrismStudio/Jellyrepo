pagina = 0;
pagina_max = 1;

f_comidas = function()
{
	for (var i = 7*pagina; i < clamp(global.itens, pagina*7, (pagina+1)*7); i++;)
	{
		var _color = c_gray;
		
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2-280, 65+75*(i-floor(i/7)*7), room_width/2+235, 135+75*(i-floor(i/7)*7)))
		{
			if (mouse_check_button(mb_left)) _color = c_ltgray;
			draw_set_color(_color);
			draw_rectangle(room_width/2-290, 65+75*(i-floor(i/7)*7), room_width/2+235, 135+75*(i-floor(i/7)*7), false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and global.gold >= global.p_preco[i])
			{
				global.gold -= global.p_preco[i];
				global.p_quantidade[i]++;
			}
		}
		
		draw_sprite_ext(spr_comidas, i, room_width/2-250, 100+75*(i-floor(i/7)*7), 4, 4, 0, c_white, 1);
		draw_text(room_width/2-200, 65+75*(i-floor(i/7)*7), "dinheiro arrecadado: " + string(global.p_dinheiro[i]));
		draw_text(room_width/2-200, 80+75*(i-floor(i/7)*7), "vezes comprado: " + string(global.p_compras[i]));
		draw_text(room_width/2-200, 95+75*(i-floor(i/7)*7), "quantidade: " + string(global.p_quantidade[i]));
		draw_text(room_width/2-200, 110+75*(i-floor(i/7)*7), "preco: $" + string(global.p_preco[i]));
	}
}