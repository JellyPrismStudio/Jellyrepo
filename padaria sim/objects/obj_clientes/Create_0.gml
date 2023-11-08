nomes = ["Juca", "Joao", "Maria", "Jossoares", "Viniccius13", "Jubscresvauda", "Paulinha"];
idades = ["15", "72", "pi", "178", "28", "45", "-10"];
genero = ["m", "m", "f", "m", "m", "f", "f"];

f_draw = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

f_close = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, false);
	draw_set_color(c_white);
	if (point_in_rectangle(mouse_x-camera_get_view_x(view_camera[0]), mouse_y-camera_get_view_y(view_camera[0]), room_width/2+302, 50, room_width/2+322, 70))
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

f_clientes = function()
{
	for (var i = 0; i < 7; i++;)
	{
		draw_sprite(spr_cliente, 0, room_width/2-240, 100+75*i);
		draw_text(room_width/2-200, 60+75*i, "nome: " + nomes[i]);
		draw_text(room_width/2-200, 75+75*i, "idade: " + idades[i]);
		draw_text(room_width/2-200, 90+75*i, "xp: " + string(global.c_xp[i]));
		draw_text(room_width/2-200, 105+75*i, "dinheiro gasto: " + string(global.c_dinheiro[i]));
	}
}