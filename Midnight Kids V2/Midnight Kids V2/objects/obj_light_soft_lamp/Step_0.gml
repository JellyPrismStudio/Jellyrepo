/// @description Custom

// Inherit the parent event
event_inherited();
//image_alpha = set_alphas;
//Custom
if _animation{
	var cos_value = cos(current_time*0.00012 + xstart + ystart + random_range(-0.08,0.08));
	if (cos_value > 0.972)
	{
		visible = false;
	}
	else
	{
		visible = true;
	}
}