draw_self()

if (global.fase > fase) image_index = 1;
else image_index = 0;

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
draw_text(x, y, string(fase))
if (global.fase == fase)
{
	image_index = 2;
	draw_text_color(x, y, string(fase), c_yellow, c_orange, c_orange, c_orange, 1);
}
draw_set_valign(-1);
draw_set_halign(-1);