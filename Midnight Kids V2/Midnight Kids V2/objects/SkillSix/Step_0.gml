x = lerp(x, pos_x, .025);

if (pos_x > xstart) image_angle -= 10;
if (pos_x < xstart) image_angle += 10;

if (subindo)
{
	y_plus = lerp(y_plus, 100, .08);
	y = ystart-y_plus;
	if (y_plus >= 93) subindo = false;
}
if (!subindo)
{
	subida += .07;
	y += subida;
	if (y == clamp(y, pos_y-7, pos_y+7)) instance_destroy();
}