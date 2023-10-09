main = function()
{
	f_monstros();
	f_mouse();
}

main();

for (var i = 0; i < ds_list_size(wave); i++;)
{
	draw_sprite(object_get_sprite(ds_list_find_value(wave, i)), 0, room_width/3+40+70*(i-floor(i/6)*6), room_height/8+40+floor(i/6)*70)
}