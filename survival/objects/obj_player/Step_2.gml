var _raio = point_in_circle(floor((mouse_x+size/2)/size)*size, floor((mouse_y+size/2)/size)*size, x, y, raio);

if (mouse_check_button_pressed(mb_left))
{
	var _col = false;
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	for (var i = floor(sprite_width/2*image_xscale); i < raio; i++;)
	{
		var _x = x+lengthdir_x(i, _dir);
		var _y = y+lengthdir_y(i, _dir);
		var _col = collision_point(_x, _y, obj_colisao, false, false);
		if (_col) break;
	}
	if (_col) instance_destroy(_col);
}

if (mouse_check_button_pressed(mb_right) and !collision_line(x, y, mouse_x, mouse_y, obj_colisao, false, false) and _raio)
{
	var _x = floor((mouse_x)/size)*size+size/2;
	var _y = floor((mouse_y)/size)*size+size/2;
	if (!collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_player, false, false)) instance_create_depth(_x, _y, -_y, obj_colisao);
}