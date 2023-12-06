for (var i = -4; i <= 4; i++;)
{
	var _col = slot == i+4? c_white : c_gray;
	var _siz = slot == i+4? 6.3 : 5;
	draw_sprite_ext(spr_slot, i, room_width/2+i*96, room_height/1.1, 3, 3, 0, _col, 1);
	draw_sprite_ext(spr_sementes, i+4, room_width/2+i*96, room_height/1.1, _siz, _siz, 0, c_white, 1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(_col);
	draw_text(room_width/2+i*96, room_height/1.1+35, string(inventario[i+4]));
	draw_set_color(c_white);
	draw_set_halign(-1);
	draw_set_valign(-1);
}