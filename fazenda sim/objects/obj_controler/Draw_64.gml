draw_set_color($110000);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1)
draw_set_color(c_white);

draw_text(10, 40, "F1 salva\nF2 recarrega");

if (global.mouse[0] != noone)
{
	draw_sprite_ext(global.mouse[0], global.mouse[1], mouse_x, mouse_y, 4, 4, 0, c_white, 1);
	draw_text(mouse_x, mouse_y, string(global.mouse[2]));
}