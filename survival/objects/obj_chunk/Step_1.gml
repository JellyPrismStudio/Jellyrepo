if (frame <=  16) frame++;
if (frame == clamp(frame, 0, 16))
{
	for (var i = x1; i < x2; i += size;)
	{
		var j = y1+size*(frame-1);
		var _val = collision_rectangle(i-size/2, j+size/2, i+size/2, j+size/2, obj_noise, true, false) and !collision_point(i, j, obj_colisao, false, false);
		ini_open("save.ini");
		var _val_ = ini_read_real("x"+string(x)+"y"+string(y), "x"+string(i)+"y"+string(j), _val)
		ini_close();
		if (_val_)
		{
			instance_create_depth(i, j, -j-size, obj_colisao);
		}
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
		if (_col)
		{
			ini_open("save.ini")
			ini_write_real("x"+string(x)+"y"+string(y), "x"+string(_col.x)+"y"+string(_col.y), false);
			ini_close();
		}
	}
	
	var _size = obj_player.size;
	var _size2 = obj_player.size/2;
	var _raio = point_in_circle(floor((mouse_x+_size2)/_size)*_size, floor((mouse_y+_size2)/_size)*_size, obj_player.x, obj_player.y, obj_player.raio);
	if (mouse_check_button_pressed(mb_right) and !collision_line(obj_player.x, obj_player.y, mouse_x, mouse_y, obj_colisao, false, false) and _raio)
	{
		var _x = floor((mouse_x+_size2)/_size)*_size;
		var _y = floor((mouse_y+_size2)/_size)*_size;
		if (!collision_rectangle(_x-_size2, _y-_size2, _x+_size2, _y+_size2, obj_player, false, false))
		{
			ini_open("save.ini")
			ini_write_real("x"+string(x)+"y"+string(y), "x"+string(_x)+"y"+string(_y), true);
			ini_close();
		}
	}
}