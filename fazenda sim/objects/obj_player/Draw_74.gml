for (var i = -3; i <= 3; i++;)
{
	var _col = slot == i+3? c_white : c_gray;
	var _siz = slot == i+3? 6.3 : 5;
	draw_sprite_ext(spr_slot, i, room_width/2+i*96, room_height/1.1, 3, 3, 0, _col, 1);
	
	if (point_in_rectangle(mouse_x, mouse_y, room_width/2+i*96-48, room_height/1.1-48, room_width/2+i*96+48, room_height/1.1+48))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2+i*96-40, room_height/1.1-40, room_width/2+i*96+40, room_height/1.1+40, false);
		draw_set_color(c_white);
		if (mouse_check_button_pressed(mb_left))
		{
			if (global.mouse[0] == inventario[0, i+3] and global.mouse[1] == inventario[1, i+3])
			{
				inventario[2, i+3] += global.mouse[2];
				global.mouse = [noone, 0, 0];
			}
			else
			{
				var _sprite = global.mouse[0];
				var _submite = global.mouse[1];
				var _qtd = global.mouse[2];
				global.mouse[0] = inventario[0, i+3];
				global.mouse[1] = inventario[1, i+3];
				global.mouse[2] = inventario[2, i+3];
				inventario[0, i+3] = _sprite;
				inventario[1, i+3] = _submite;
				inventario[2, i+3] = _qtd;
			}
		}
	}
	
	if (inventario[0, i+3] != noone) draw_sprite_ext(inventario[0, i+3], inventario[1, i+3], room_width/2+i*96, room_height/1.1, _siz, _siz, 0, c_white, 1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(_col);
	if (inventario[2, i+3]) draw_text(room_width/2+i*96, room_height/1.1+35, string(inventario[2, i+3]));
	draw_set_color(c_white);
	draw_set_halign(-1);
	draw_set_valign(-1);
}

draw_sprite_ext(spr_moedas, 0, 25, 25, 3, 3, 0, c_white, 1);
draw_text(50, 7, ": "+string(dinheiro));