timer--;
if (timer == 0)
{
	dia = !dia;
	timer = timer_max;
}

if (!dia)
{
	alpha = lerp(alpha, alpha_max, .05);
	if (alpha >= alpha_max-.05) alpha = alpha_max;
}
else
{
	alpha = lerp(alpha, 0, .05);
	if (alpha <= .05 and alpha > 0)
	{
		alpha = 0;
		repeat (instance_number(obj_porco))
		{
			obj_player.dinheiro += 5;
		}
		repeat (instance_number(obj_galinha))
		{
			obj_player.dinheiro += 4;
		}
		repeat (instance_number(obj_vaca))
		{
			obj_player.dinheiro += 3;
		}
	}
}

if (keyboard_check_pressed(vk_f1)) game_save("save");
if (keyboard_check_pressed(vk_f2)) game_load("save");