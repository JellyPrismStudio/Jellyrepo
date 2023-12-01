if (place_meeting(x, y, obj_player))
{
	if (keyboard_check(vk_space) and !space_press and planta > 0)
	{
		if (planta == 4) planta = 0;
		else if (molhado == false)
		{
			molhado = true;
			timer = timer_max;
		}
		space_press = true;
	}
	if (keyboard_check(vk_shift) and !shift_press)
	{
		if (planta == 0) planta = 1;
		shift_press = true;
	}
}
if (keyboard_check_released(vk_space) or !place_meeting(x, y, obj_player)) space_press = false;
if (keyboard_check_released(vk_shift) or !place_meeting(x, y, obj_player)) shift_press = false;

image_blend = c_white;
if (molhado)
{
	image_blend = c_maroon;
	timer--;
	if (timer == 0) 
	{
		molhado = false;
		planta++;
	}
}