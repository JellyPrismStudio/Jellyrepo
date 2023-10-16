if (keyboard_check_pressed(vk_up)) global.fase++;
if (keyboard_check_pressed(vk_down)) global.fase--;

main = function()
{
	f_mapa();
	f_shop();
}

main();