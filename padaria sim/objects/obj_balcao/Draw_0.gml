draw_self();
for (var i = -2; i < 3; i++)
{
	draw_sprite_ext(spr_comidas, i+2, x+35*i, y-70, 2, 2, 0, c_white, 1);
	draw_text(x+34*i, y-50, string(comidas[1, i+2]))
}