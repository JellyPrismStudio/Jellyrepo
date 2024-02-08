if (point_distance(x, y, obj_player.x, obj_player.y) > 1500)
{
	instance_destroy();
	var _x1 = x-obj_seed.size*2;
	var _y1 = y-obj_seed.size*2;
	var _x2 = _x1+obj_seed.size*16;
	var _y2 = _y1+obj_seed.size*16;
	var _list = ds_list_create()
	collision_rectangle_list(_x1, _y1, _x2, _y2, obj_colisao, false, true, _list, false);
	for (var i = 0; i < ds_list_size(_list); i++;)
	{
		instance_destroy(ds_list_find_value(_list, i));
	}
	ds_list_destroy(_list);
}