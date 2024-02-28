for (var i = x1; i < x2; i += size;)
{
	for (var j = y1; j < y2; j += size;)
	{
		var _col = collision_point(i, j, obj_colisao, false, true);
		if (_col)
		{
			instance_destroy(_col, false);
		}
	}
}