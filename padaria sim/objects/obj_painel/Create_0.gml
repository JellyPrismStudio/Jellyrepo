f_draw = function()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

f_cliente = function()
{
	draw_sprite_ext(obj.sprite_index, 0, room_width/2-200, room_height/2, 2.5, 2.5, 0, c_white, 1);
	draw_text(room_width/2-80, 80, "level: " + string(obj.lvl));
	draw_text(room_width/2-80, 100, "xp: " + string(obj.xp));
	draw_text(room_width/2-80, 120, "nome: " + obj.nomes[obj.cliente]);
	draw_text(room_width/2-80, 140, "idade: " + obj.idades[obj.cliente]);
	draw_text(room_width/2-80, 160, "genero: " + obj.genero[obj.cliente]);
	draw_text(room_width/2-80, 180, "dinheiro: " + string(obj.dinheiro));
	draw_text(room_width/2-80, 200, "dinheiro inicial: " + string(obj.start_money));
	if (obj.inventario[0, 0] != "")
	{
		for (var i = 0; i < array_length(obj.inventario); i++;)
		{
			draw_sprite_ext(spr_comidas, obj.inventario[i, 1], room_width/2-30+100*i, 300, 5, 5, 0, c_white, 1);
		}
	}
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