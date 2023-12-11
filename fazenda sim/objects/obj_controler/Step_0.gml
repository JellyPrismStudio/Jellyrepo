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
	if (alpha <= .05) alpha = 0;
}

if (keyboard_check_pressed(vk_f1)) game_save("save");
if (keyboard_check_pressed(vk_f2)) game_load("save");