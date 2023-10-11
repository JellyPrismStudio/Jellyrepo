main = function()
{
	f_ui();
	f_speed();
}

main();

if (keyboard_check_pressed(vk_up)) global.game_speed++;
if (keyboard_check_pressed(vk_down)) global.game_speed--;