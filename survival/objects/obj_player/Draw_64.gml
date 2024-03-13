var _w = view_wport[0];
var _h = view_hport[0];

for (var i = 0; i < 10; i++;)
{
	draw_set_color(c_dkgray);
	draw_rectangle(_w/2-24+(i-4.5)*48, _h-96, _w/2+24+(i-4.5)*48, _h-48, false);
	draw_set_color(c_white);
	draw_rectangle(_w/2-24+(i-4.5)*48, _h-96, _w/2+24+(i-4.5)*48, _h-48, true);
	draw_rectangle(_w/2-23+(i-4.5)*48, _h-95, _w/2+23+(i-4.5)*48, _h-49, true);
	
	if (item[0, i] != noone)
	{
		draw_sprite_ext(item[0, i], item[1, i], _w/2+(i-4.5)*48, _h-70, 3, 3, 0, c_white, 1);
		draw_set_halign(fa_center);
		if (item[2, i] > 1) draw_text(_w/2+(i-4.5)*48+16, _h-64, string(item[2, i]));
		draw_set_halign(-1);
	}
}

