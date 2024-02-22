var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);

for (var i = 0; i < 10; i++;)
{
	draw_set_color(c_dkgray);
	draw_rectangle(_x+_w/2-32+(i-5)*64, _y+_h-128, _x+_w/2+32+(i-5)*64, _y+_h-64, false);
	draw_set_color(c_white);
	draw_rectangle(_x+_w/2-32+(i-5)*64, _y+_h-128, _x+_w/2+32+(i-5)*64, _y+_h-64, true);
	draw_rectangle(_x+_w/2-31+(i-5)*64, _y+_h-127, _x+_w/2+31+(i-5)*64, _y+_h-65, true);
	
	if (item[0, i] != noone)
	{
		draw_sprite_ext(item[0, i], item[1, i], _x+_w/2+(i-5)*64, _y+_h-96, 4, 4, 0, c_white, 1);
		draw_set_halign(fa_center);
		if (item[2, i] > 1) draw_text(_x+_w/2+(i-5)*64, _y+_h-80, string(item[2, i]));
		draw_set_halign(-1);
	}
}