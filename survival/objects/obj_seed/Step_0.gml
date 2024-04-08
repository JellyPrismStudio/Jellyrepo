var _x = floor(obj_player.x/10/size)*10*size+10*size/2;
var _y = floor(obj_player.y/10/size)*10*size+10*size/2;

if (chunkx != floor(obj_player.x/size/10) or chunky != floor(obj_player.y/size/10))
{
	for (var i = -1; i <= 1; i++;)
	{
		for (var j = -1; j <= 1; j++;)
		{
			if (!collision_point(_x+size*10*i, _y+size*10*j, obj_chunk, false, false))
			{
				instance_create_depth(_x+size*10*i, _y+size*10*j, -_y+size*10*j, obj_chunk);
				obj_grid.alarm[0] = 16;
			}
		}
	}
	with (obj_chunk)
	{
		var _disx = abs(floor(x/size/10)-floor(obj_player.x/size/10));
		var _disy = abs(floor(y/size/10)-floor(obj_player.y/size/10));
		if (_disx > 1 or _disy > 1)
		{
			instance_destroy();
		}
	}
}

chunkx = floor(obj_player.x/size/10);
chunky = floor(obj_player.y/size/10);

timer_day--;
if (timer_day == 0)
{
	day = !day;
	timer_day = timer_day_max;
}

if (!day)
{
	alpha = lerp(alpha, alpha_max, .002);
	if (alpha >= alpha_max-.01) alpha = alpha_max;
}
else
{
	alpha = lerp(alpha, 0, .002);
	if (alpha <= .01 and alpha > 0)
	{
		alpha = 0;
	}
}