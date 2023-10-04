if (global.ima > 0)
{
	global.ima--;
	var _ima = instance_create_depth(obj_player.x, obj_player.y, 0, obj_ima);
	_ima.player = true;
	_ima.timer = 60*60;
	
	ini_open("stats.ini");
	ini_write_real("stats", "imã", global.ima);
	ini_close();
}

if (global.shield > 0)
{
	global.shield--;
	var _shield = instance_create_depth(obj_player.x, obj_player.y, 0, obj_escudo);
	_shield.player = true;
	_shield.timer = 60*60;
	
	ini_open("stats.ini");
	ini_write_real("stats", "escudo", global.shield);
	ini_close();
}

if (global.star > 0)
{
	global.star--;
	var _star = instance_create_depth(obj_player.x, obj_player.y, 0, obj_estrela);
	_star.player = true;
	_star.timer = 60*60;
	
	ini_open("stats.ini");
	ini_write_real("stats", "estrela", global.star);
	ini_close();
}