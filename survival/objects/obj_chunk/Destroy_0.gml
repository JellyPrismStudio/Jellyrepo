for (var i = x1+size/2; i < x2+size/2; i += size;)
{
	for (var j = y1+size/2; j < y2+size/2; j += size;)
	{
		var _col = collision_point(i, j, obj_colisao, false, true);
		if (_col)
		{
			instance_destroy(_col, false);
		}
		var _col = collision_point(i, j, obj_floor, false, true);
		if (_col)
		{
			instance_destroy(_col, false);
		}
	}
}