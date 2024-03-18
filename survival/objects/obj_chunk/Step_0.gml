repeat (3)
{
	if (frame <=  100) frame++;
	if (frame == clamp(frame, 0, 100))
	{
		var _x = frame-1;
		var _y = 0;
		while (_x >= 10)
		{
			_x -= 10;
			_y++;
		}
		_x *= size;
		_y *= size;
		_x += x1+size/2;
		_y += y1+size/2;
		var _val = collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_noise_dirt, true, false) and !collision_point(_x, _y, obj_colisao, false, false);
		if (ds_list_size(global.chunks[x1/size/10+1, y1/size/10+1]) < frame)
		{
			ds_list_add(global.chunks[x1/size/10+1, y1/size/10+1], _val)
		}
		else
		{
			_val = ds_list_find_value(global.chunks[x1/size/10+1, y1/size/10+1], frame-1);
		}
		var _sand = collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_noise_sand, true, false) and !collision_point(_x, _y, obj_colisao, false, false);
		if (_val)
		{
			var _obj = instance_create_depth(_x, _y, -_y-size, obj_colisao);
			if (_sand) _obj.sprite_index = spr_tile_sand;
		}
		
		instance_create_depth(_x, _y, -_y+size, obj_floor);
	}
}