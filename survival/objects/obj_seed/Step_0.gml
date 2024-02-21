var _x = floor(obj_player.x/16/size)*16*size+16*size/2;
var _y = floor(obj_player.y/16/size)*16*size+16*size/2;

if (chunkx != floor(obj_player.x/size/16) or chunky != floor(obj_player.y/size/16))
{
	for (var i = -1; i <= 1; i++;)
	{
		for (var j = -1; j <= 1; j++;)
		{
			if (!collision_point(_x+size*16*i, _y+size*16*j, obj_chunk, false, false))
			{
				instance_create_depth(_x+size*16*i, _y+size*16*j, -_y+size*16*j, obj_chunk);
			}
		}
	}
	with (obj_chunk)
	{
		if (abs(floor(x/size/16)-floor(obj_player.x/size/16)) > 1 or abs(floor(y/size/16)-floor(obj_player.y/size/16)) > 1)
		{
			instance_destroy();
		}
	}
}

chunkx = floor(obj_player.x/size/16);
chunky = floor(obj_player.y/size/16);