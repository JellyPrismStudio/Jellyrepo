if (tiros/2 == round(tiros/2))
{
	for (var i = -tiros/2; i < tiros/2; i++;)
	{
		var tiro = instance_create_depth(x, y, global.player.depth, obj_tiro);
		tiro.dir = dir+i*20;
		tiro.image_angle = dir+i*20;
	}
}
else
{
	for (var i = floor(-tiros/2); i < floor(tiros/2); i++;)
	{
		var tiro = instance_create_depth(x, y, global.player.depth, obj_tiro);
		tiro.dir = dir+i*20;
		tiro.image_angle = dir+i*20;
	}
}

instance_destroy();