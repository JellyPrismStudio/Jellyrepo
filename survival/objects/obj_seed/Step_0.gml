var _x1 = floor(obj_player.x/16/size)*16*size;
var _x2 = floor(obj_player.x/16/size)*16*size+16*64;
var _y1 = floor(obj_player.y/16/size)*16*size;
var _y2 = floor(obj_player.y/16/size)*16*size+16*64;
frame++;

if (!collision_rectangle(_x1, _y1, _x2, _y2, Object8, false, false) and frame == 1)
{
	instance_create_depth(_x1+size, _y1+size, 0, Object8);
	for (var i = _x1; i < _x2; i += size;)
	{
		for (var j = _y1; j < _y2; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1-16*size, _y1, _x2-16*size, _y2, Object8, false, false) and frame == 10)
{
	instance_create_depth(_x1+size-16*size, _y1+size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		for (var j = _y1; j < _y2; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1, _x2+16*size, _y2, Object8, false, false) and frame == 20)
{
	instance_create_depth(_x1+size+16*size, _y1+size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		for (var j = _y1; j < _y2; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1, _y1+16*size, _x2, _y2+16*size, Object8, false, false) and frame == 30)
{
	instance_create_depth(_x1+size, _y1+size+16*size, 0, Object8);
	for (var i = _x1; i < _x2; i += size;)
	{
		for (var j = _y1+16*size; j < _y2+16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1, _y1-16*size, _x2, _y2-16*size, Object8, false, false) and frame == 40)
{
	instance_create_depth(_x1+size, _y1+size-16*size, 0, Object8);
	for (var i = _x1; i < _x2; i += size;)
	{
		for (var j = _y1-16*size; j < _y2-16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1-16*size, _y1-16*size, _x2-16*size, _y2-16*size, Object8, false, false) and frame == 50)
{
	instance_create_depth(_x1+size-16*size, _y1+size-16*size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		for (var j = _y1-16*size; j < _y2-16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1-16*size, _y1+16*size, _x2-16*size, _y2+16*size, Object8, false, false) and frame == 60)
{
	instance_create_depth(_x1+size-16*size, _y1+size+16*size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		for (var j = _y1+16*size; j < _y2+16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1-16*size, _x2+16*size, _y2-16*size, Object8, false, false) and frame == 70)
{
	instance_create_depth(_x1+size+16*size, _y1+size-16*size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		for (var j = _y1-16*size; j < _y2-16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1+16*size, _x2+16*size, _y2+16*size, Object8, false, false) and frame == 80)
{
	instance_create_depth(_x1+size+16*size, _y1+size+16*size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		for (var j = _y1+16*size; j < _y2+16*size; j += size;)
		{
			if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
			{
				instance_create_depth(i, j, -j-size, obj_colisao);
			}
		}
	}
}

if (frame == 90) frame = 0;