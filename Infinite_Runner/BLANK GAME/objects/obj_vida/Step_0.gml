main = function()
{
	f_place_obstacle();
	f_sprite();
	y += layer_get_vspeed("fundo");
	
	//destruindo o objeto caso o player esteja com a vida cheia
	if (obj_player.vida == 2) instance_destroy();
}

main();