var _x1 = floor(obj_player.x/16/size)*16*size;
var _x2 = floor(obj_player.x/16/size)*16*size+16*size;
var _y1 = floor(obj_player.y/16/size)*16*size;
var _y2 = floor(obj_player.y/16/size)*16*size+16*size;
if (!collision_rectangle(_x1, _y1, _x2, _y2, Object8, false, false) and frame == 0)
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
if (!collision_rectangle(_x1-16*size, _y1, _x2-16*size, _y2, Object8, false, false) and frame == clamp(frame, 0, 16))
{
	if (frame == 16) instance_create_depth(_x1+size-16*size, _y1+size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		var j = _y1+size*(frame-1);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1, _x2+16*size, _y2, Object8, false, false) and frame == clamp(frame, 16, 32))
{
	if (frame == 32) instance_create_depth(_x1+size+16*size, _y1+size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		var j = _y1+size*(frame-17);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1, _y1+16*size, _x2, _y2+16*size, Object8, false, false) and frame == clamp(frame, 32, 48))
{
	if (frame == 48) instance_create_depth(_x1+size, _y1+size+16*size, 0, Object8);
	for (var i = _x1; i < _x2; i += size;)
	{
		var j = _y1+size*16+size*(frame-33);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1, _y1-16*size, _x2, _y2-16*size, Object8, false, false) and frame == clamp(frame, 48, 64))
{
	if (frame == 64) instance_create_depth(_x1+size, _y1+size-16*size, 0, Object8);
	for (var i = _x1; i < _x2; i += size;)
	{
		var j = _y1-size*16+size*(frame-49);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1-16*size, _y1-16*size, _x2-16*size, _y2-16*size, Object8, false, false) and frame == clamp(frame, 64, 80))
{
	if (frame == 80) instance_create_depth(_x1+size-16*size, _y1+size-16*size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		var j = _y1+size*(frame-81);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1-16*size, _y1+16*size, _x2-16*size, _y2+16*size, Object8, false, false) and frame == clamp(frame, 80, 96))
{
	if (frame == 96) instance_create_depth(_x1+size-16*size, _y1+size+16*size, 0, Object8);
	for (var i = _x1-16*size; i < _x2-16*size; i += size;)
	{
		var j = _y1+size*32+size*(frame-97);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1-16*size, _x2+16*size, _y2-16*size, Object8, false, false) and frame == clamp(frame, 96, 112))
{
	if (frame == 112) instance_create_depth(_x1+size+16*size, _y1+size-16*size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		var j = _y1+size*(frame-113);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}
if (!collision_rectangle(_x1+16*size, _y1+16*size, _x2+16*size, _y2+16*size, Object8, false, false) and frame == clamp(frame, 112, 128))
{
	if (frame == 96) instance_create_depth(_x1+size+16*size, _y1+size+16*size, 0, Object8);
	for (var i = _x1+16*size; i < _x2+16*size; i += size;)
	{
		var j = _y1+size*32+size*(frame-129);
		if (collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false))
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
	}
}

frame++;
if (frame == 129) frame = 0;
if (floor(obj_player.x/16/size) != floor(x_/16/size) or floor(obj_player.y/16/size) != floor(y_/16/size))
{
	frame = 0;
}
x_ = obj_player.x;
y_ = obj_player.y;