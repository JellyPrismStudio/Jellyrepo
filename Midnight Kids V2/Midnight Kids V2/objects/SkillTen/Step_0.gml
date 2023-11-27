var col = instance_place(x, y, oENM_Main);
if (col)
{
	col.x = x;
	col.y = y;
	col.target_x = x;
	col.target_y = y;
	if (!animacao) image_speed = 1;
}