if light_animation {
	var cos_value = cos(current_time*animtime2 + xstart + ystart + random_range(-0.08,0.08));
	if (cos_value > animtime)
	{
		visible = false;
	}
	else
	{
		visible = true;
	}
}