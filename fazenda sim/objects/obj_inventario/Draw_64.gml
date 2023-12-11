if (x_ < x_max and abrindo) x_ = lerp(x_, x_max, .3);
if (!abrindo)
{
	x_ = lerp(x_, -64, .3);
	if (x_ <= -62) instance_destroy();
}

for (var i = 0; i < 20; i++;)
{
	draw_sprite_ext(spr_slot, 0, room_width-x_+64*(i-floor(i/4)*4), 100+64*(floor(i/4)), 2, 2, 0, c_white, 1);
	draw_set_color(c_gray);
	if (point_in_rectangle(mouse_x, mouse_y, room_width-x_+64*(i-floor(i/4)*4)-32, 100+64*(floor(i/4))-32, room_width-x_+64*(i-floor(i/4)*4)+32, 100+64*(floor(i/4))+32))
	{
		draw_rectangle(room_width-x_+64*(i-floor(i/4)*4)-28, 100+64*(floor(i/4))-28, room_width-x_+64*(i-floor(i/4)*4)+28, 100+64*(floor(i/4))+28, false);
		if (mouse_check_button_pressed(mb_left))
		{
			if (global.mouse[0] == global.inventario[i, 0] and global.mouse[1] == global.inventario[i, 1])
			{
				global.inventario[i, 2] += global.mouse[2];
				global.mouse = [noone, 0, 0];
			}
			else
			{
				var _sprite = global.mouse[0];
				var _submite = global.mouse[1];
				var _qtd = global.mouse[2];
				global.mouse[0] = global.inventario[i, 0];
				global.mouse[1] = global.inventario[i, 1];
				global.mouse[2] = global.inventario[i, 2];
				global.inventario[i, 0] = _sprite;
				global.inventario[i, 1] = _submite;
				global.inventario[i, 2] = _qtd;
			}
		}
	}
	draw_set_color(c_white);
	
	if (global.inventario[i, 0] != noone)
	draw_sprite_ext(global.inventario[i, 0], global.inventario[i, 1], room_width-x_+64*(i-floor(i/4)*4), 100+64*(floor(i/4)), 4, 4, 0, c_white, 1);
	if (global.inventario[i, 2] > 0) draw_text(room_width-x_+64*(i-floor(i/4)*4), 100+64*(floor(i/4)), string(global.inventario[i, 2]));
}

if (keyboard_check_pressed(ord("E")) and abrindo) abrindo = false;