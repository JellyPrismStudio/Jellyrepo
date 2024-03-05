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


var _r = obj_player.raio+obj_player.sprite_width*obj_player.image_xscale;
if (mouse_check_button_pressed(mb_any))
{
	if (mouse_check_button_pressed(mb_left))
	{
		var _dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
		for (var i = floor(obj_player.sprite_width/2*obj_player.image_xscale); i < obj_player.raio; i++;)
		{
			var _x = obj_player.x+lengthdir_x(i, _dir);
			var _y = obj_player.y+lengthdir_y(i, _dir);
			var _col = collision_point(_x, _y, obj_colisao, false, false);
			if (_col) break;
		}
		if (_col and _col.x == clamp(_col.x, x1, x2) and _col.y == clamp(_col.y, y1, y2))
		{
			var _x = (_col.x-x1-size/2)/size;
			var _y = (_col.y-y1-size/2)/size*16;
			var _pos = _x+_y;
			ds_list_set(global.chunks[x1/size/16+1, y1/size/16+1], _pos, 0);
		}
	}
	
	var _size = obj_player.size;
	var _size2 = obj_player.size/2;
	var _raio = point_in_circle(floor((mouse_x+_size2)/_size)*_size, floor((mouse_y+_size2)/_size)*_size, obj_player.x, obj_player.y, obj_player.raio);
	if (mouse_check_button_pressed(mb_right) and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, obj_colisao, false, false) and _raio)
	{
		var _x = floor((mouse_x)/size)*size+size/2;
		var _y = floor((mouse_y)/size)*size+size/2;
		if (!collision_rectangle(_x-_size2, _y-_size2, _x+_size2, _y+_size2, obj_player, false, false) and _x == clamp(_x, x1, x2) and _y == clamp(_y, y1, y2))
		{
			var _x = (_x-x1-size/2)/size;
			var _y = (_y-y1-size/2)/size*16;
			var _pos = _x+_y;
			show_debug_message(_pos)
			ds_list_set(global.chunks[x1/size/16+1, y1/size/16+1], _pos, 1);
		}
	}
}