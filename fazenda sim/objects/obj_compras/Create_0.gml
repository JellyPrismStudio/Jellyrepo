f_fundo = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 30, room_width/2+300, room_height-20, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 30, room_width/2+300, room_height-20, false);
	draw_set_color(c_white);

	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 30, room_width/2+322, 50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 30, room_width/2+322, 50, false);
	draw_set_color(c_white);
}

f_fecha = function()
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2+302, 30, room_width/2+322, 50))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2+305, 33, room_width/2+319, 47, false);
		draw_set_color(c_white);
		if (mouse_check_button_pressed(mb_left))
		{
			instance_destroy();
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(room_width/2+312, 40, "X")
	draw_set_valign(-1);
	draw_set_halign(-1);
}

f_comprar = function()
{
	draw_text(room_width/2-290, 30, "comprar:");
	var precos = [1, 2,	3, 5, 4, 7, 8, 9];
	var planta = ["café", "cenoura", "tomate", "milho", "maça", "pessego", "limão", "adubo"];
	for (var i = 0; i < 8; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-250+100*(i-(floor(i/6))*6)-45, 150-45+120*floor(i/6), room_width/2-250+100*(i-(floor(i/6))*6)+45, 150+45+120*floor(i/6)))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+100*(i-(floor(i/6))*6)-45, 150-45+120*floor(i/6),room_width/2-250+100*(i-(floor(i/6))*6)+45, 150+45+120*floor(i/6), false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and obj_player.inventario[MOEDAS] >= precos[i])
			{
				obj_player.inventario[i] ++;
				obj_player.inventario[MOEDAS] -= precos[i];
			}
		}
		
		draw_sprite_ext(spr_sementes, i, room_width/2-250+100*(i-(floor(i/6))*6), 150+120*floor(i/6), 6, 6, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(room_width/2-250+100*(i-(floor(i/6))*6), 150-40+120*floor(i/6), string(planta[i]));
		draw_text(room_width/2-250+100*(i-(floor(i/6))*6)+37, 150+47+120*floor(i/6), string(precos[i]));
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
}

f_vender = function()
{
	draw_text(room_width/2-290, 330, "vender:");
	var precos = [1, 2,	3, 5, 4, 7, 8, 9];
	var planta = ["café", "cenoura", "tomate", "milho", "maça", "pessego", "limão", "adubo"];
	for (var i = 0; i < 8; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-250+100*(i-(floor(i/6))*6)-45, 450-45+120*floor(i/6), room_width/2-250+100*(i-(floor(i/6))*6)+45, 450+45+120*floor(i/6)))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+100*(i-(floor(i/6))*6)-45, 450-45+120*floor(i/6),room_width/2-250+100*(i-(floor(i/6))*6)+45, 450+45+120*floor(i/6), false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and obj_player.inventario[i] > 0)
			{
				obj_player.inventario[i]--;
				obj_player.inventario[MOEDAS] += precos[i];
			}
		}
		
		draw_sprite_ext(spr_sementes, i, room_width/2-250+100*(i-(floor(i/6))*6), 450+120*floor(i/6), 6, 6, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(room_width/2-250+100*(i-(floor(i/6))*6), 450-40+120*floor(i/6), string(planta[i]));
		draw_text(room_width/2-250+100*(i-(floor(i/6))*6)+37, 450+47+120*floor(i/6), string(precos[i]));
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
}