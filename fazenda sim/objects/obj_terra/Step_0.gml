randomize();
depth = -(y-sprite_height/2);

if (place_meeting(x, y, obj_player))
{
	if (keyboard_check(vk_space) and !space_press and planta > 0)
	{
		if (planta == 4)
		{
			planta = 0;
			if (sprite[spr] == spr_cafe) obj_player.inventario[0] += 2;
			if (sprite[spr] == spr_cenoura) obj_player.inventario[6] += 4;
			if (sprite[spr] == spr_tomate) obj_player.inventario[6] += 6;
			if (sprite[spr] == spr_milho)
			{
				planta = 2;
				obj_player.inventario[6] += 4;
			}
			
		}
		else if (molhado == false)
		{
			molhado = true;
			timer = timer_max;
		}
		space_press = true;
	}
	if (keyboard_check(vk_shift) and !shift_press and obj_player.inventario[obj_player.slot] > 0 and obj_player.slot != 6)
	{
		if (obj_player.slot != 4)
		{
			if (planta == 0)
			{
				planta = 1;
				obj_player.inventario[obj_player.slot]--;
				spr = obj_player.slot;
			}
			shift_press = true;
		}
		else
		{
			timer_max = 300;
			adubado += 10;
			obj_player.inventario[obj_player.slot]--;
		}
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
		if (adubado > 0)
		{
			adubado--;
			if (adubado == 0) timer_max = 600;
		}
		show_message(string(adubado))
	}
}

if (adubado > 0) image_blend = image_blend == c_white? c_gray : c_black;