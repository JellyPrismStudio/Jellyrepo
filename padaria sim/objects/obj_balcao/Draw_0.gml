draw_self();
var _length = array_length(comidas[0]);
for (var i = -floor(_length/2); i < ceil(_length/2); i++)
{
	draw_sprite_ext(spr_comidas, comidas[2, i+floor(_length/2)], x+35*i, y-70, 2, 2, 0, c_white, 1);
	draw_text(x+34*i, y-50, string(comidas[1, i+floor(_length/2)]))
}