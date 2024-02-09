if (point_distance(x, y, obj_player.x, obj_player.y) > 1500)
{
	instance_destroy();
	var _x1 = x-size*2;
	var _y1 = y-size*2;
	var _x2 = _x1+size*16;
	var _y2 = _y1+size*16;
	var _list = ds_list_create()
	collision_rectangle_list(_x1, _y1, _x2, _y2, obj_colisao, false, true, _list, false);
	for (var i = 0; i < ds_list_size(_list); i++;)
	{
		instance_destroy(ds_list_find_value(_list, i));
	}
	ds_list_destroy(_list);
}

var _x1 = x-size*2;
var _y1 = y-size*2;
var _x2 = _x1+size*16;
var _y2 = _y1+size*16;
if (frame <= 16) frame++;
if (frame == clamp(frame, 0, 16))
{
	for (var i = _x1; i < _x2; i += size;)
	{
		var j = _y1+size*(frame-1);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}