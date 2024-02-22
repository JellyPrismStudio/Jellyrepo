if (!col and point_distance(x, y, obj_player.x, obj_player.y) < 80)
{
	col = true;
}

if (col)
{
	var _slot = noone;
	for (var i = 0; i < 20 and _slot == noone; i++;)
	{
		if (i < 10)
		{
			if (obj_player.item[0, i] == sprite_index and obj_player.item[1, i] == image_index)
			{
				_slot = i;
			}
		}
		if (i >= 10)
		{
			if (obj_player.item[0, i-10] == noone)
			{
				_slot = i-10;
			}
		}
	}
	if (_slot != noone)
	{
		x = lerp(x, obj_player.x, .03);
		y = lerp(y, obj_player.y, .03);
		if (place_meeting(x, y, obj_player))
		{
			obj_player.item[0, _slot] = sprite_index;
			obj_player.item[1, _slot] = image_index;
			obj_player.item[2, _slot]++;
			instance_destroy();
		}
	}
}