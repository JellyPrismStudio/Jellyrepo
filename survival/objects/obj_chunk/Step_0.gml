if (frame <=  128) frame++;
if (frame == clamp(frame, 0, 128))
{
	var _x = frame*2-2;
	var _y = 0;
	while (_x >= 16)
	{
		_x -= 16;
		_y++;
	}
	_x *= size;
	_y *= size;
	_x += x1+size/2;
	_y += y1+size/2;
	var _val = collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_noise_dirt, true, false) and !collision_point(_x, _y, obj_colisao, false, false);
	if (ds_list_size(global.chunks[x1/size/16+1, y1/size/16+1]) < frame*2)
	{
		ds_list_add(global.chunks[x1/size/16+1, y1/size/16+1], _val)
	}
	else
	{
		_val = ds_list_find_value(global.chunks[x1/size/16+1, y1/size/16+1], frame*2-2);
	}
	var _sand = collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_noise_sand, true, false) and !collision_point(_x, _y, obj_colisao, false, false);
	if (_val)
	{
		var _obj = instance_create_depth(_x, _y, -_y-size, obj_colisao);
		if (_sand) _obj.sprite_index = spr_tile_sand;
	}
	
	var _val = collision_rectangle(_x-size/2+size, _y-size/2, _x+size/2+size, _y+size/2, obj_noise_dirt, true, false) and !collision_point(_x+size, _y, obj_colisao, false, false);
	if (ds_list_size(global.chunks[x1/size/16+1, y1/size/16+1]) < frame*2+1)
	{
		ds_list_add(global.chunks[x1/size/16+1, y1/size/16+1], _val)
	}
	else
	{
		_val = ds_list_find_value(global.chunks[x1/size/16+1, y1/size/16+1], frame*2-1);
	}
	var _sand = collision_rectangle(_x-size/2+size, _y-size/2, _x+size/2+size, _y+size/2, obj_noise_sand, true, false) and !collision_point(_x+size, _y, obj_colisao, false, false);
	if (_val)
	{
		var _obj = instance_create_depth(_x+size, _y, -_y-size, obj_colisao);
		if (_sand) _obj.sprite_index = spr_tile_sand;
	}
}