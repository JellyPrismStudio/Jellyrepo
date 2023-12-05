f_fundo = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);

	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, false);
	draw_set_color(c_white);
}

f_fecha = function()
{
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

f_comprar = function()
{
	draw_text(room_width/2-290, 50, "comprar:");
	var precos = [1, 2,	3, 5, 4, 7];
	var planta = ["café", "cenoura", "tomate", "milho", "adubo", "árvore"];
	for (var i = 0; i < 6; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-250+100*i-45, 170-45, room_width/2-250+100*i+45, 170+45))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+100*i-45, 170-45,room_width/2-250+100*i+45, 170+45, false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and obj_player.inventario[6] >= precos[i])
			{
				obj_player.inventario[i] ++;
				obj_player.inventario[6] -= precos[i];
			}
		}
		
		draw_sprite_ext(spr_sementes, i, room_width/2-250+100*i, 170, 6, 6, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(room_width/2-250+100*i, 170-50, string(planta[i]));
		draw_text(room_width/2-250+100*i+37, 170+47, string(precos[i]));
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
}

f_vender = function()
{
	draw_text(room_width/2-290, 250, "vender:");
	var precos = [1, 2,	3, 5, 4, 7];
	var planta = ["café", "cenoura", "tomate", "milho", "adubo", "árvore"];
	for (var i = 0; i < 6; i++;)
	{
		if (point_in_rectangle(mouse_x, mouse_y, room_width/2-250+100*i-45, 370-45, room_width/2-250+100*i+45, 370+45))
		{
			draw_set_color(c_gray);
			draw_rectangle(room_width/2-250+100*i-45, 370-45,room_width/2-250+100*i+45, 370+45, false);
			draw_set_color(c_white);
			
			if (mouse_check_button_pressed(mb_left) and obj_player.inventario[i] > 0)
			{
				obj_player.inventario[i]--;
				obj_player.inventario[6] += precos[i];
			}
		}
		
		draw_sprite_ext(spr_sementes, i, room_width/2-250+100*i, 370, 6, 6, 0, c_white, 1);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(room_width/2-250+100*i, 370-50, string(planta[i]));
		draw_text(room_width/2-250+100*i+37, 370+47, string(precos[i]));
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
}