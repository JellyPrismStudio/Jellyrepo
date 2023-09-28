main = function()
{
	f_place_obstacle();
	f_player();
	if (!player) y += layer_get_vspeed("fundo");
	
	if (y > room_height+100) instance_destroy();
}

main();