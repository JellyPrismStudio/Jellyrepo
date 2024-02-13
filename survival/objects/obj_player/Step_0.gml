size = obj_seed.size;

var w = keyboard_check(ord("W"));
var a = keyboard_check(ord("A"));
var s = keyboard_check(ord("S"));
var d = keyboard_check(ord("D"));

switch (state)
{
	case "idle":
		if (w+a+s+d > 0) state = "walk";
		vlh = lerp(vlh, 0, slide);
		vlv = lerp(vlv, 0, slide);
	break;
	
	case "walk":
		if (w+a+s+d == 0)
		{
			state = "idle";
			break;
		}
		var _vlh = d-a;
		var _vlv = s-w;
		var _dir = point_direction(x, y, x+_vlh, y+_vlv);
		_vlh = lengthdir_x(vl, _dir);
		_vlv = lengthdir_y(vl, _dir);
		vlh = lerp(vlh, _vlh, slide);
		vlv = lerp(vlv, _vlv, slide);
	break;
}

repeat (abs(vlh))
{
	if (!place_meeting(x+sign(vlh), y, obj_colisao)) x += sign(vlh);
	else
	{
		if (!place_meeting(x+sign(vlh), y-vl*3, obj_colisao)) y -= 1;
		else if (!place_meeting(x+sign(vlh), y+vl*3, obj_colisao)) y += 1;
	}
}
repeat (abs(vlv))
{
	if (!place_meeting(x, y+sign(vlv), obj_colisao)) y += sign(vlv);
	else
	{
		if (!place_meeting(x-vl*3, y+sign(vlv), obj_colisao)) x -= 1;
		else if (!place_meeting(x+vl*3, y+sign(vlv), obj_colisao)) x += 1;
	}
}

var _raio = point_in_circle(floor((mouse_x+size/2)/size)*size, floor((mouse_y+size/2)/size)*size, x, y, raio);

if (mouse_check_button_pressed(mb_left))
{
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
	var _x = floor((mouse_x+size/2)/size)*size;
	var _y = floor((mouse_y+size/2)/size)*size;
	if (!collision_rectangle(_x-size/2, _y-size/2, _x+size/2, _y+size/2, obj_player, false, false)) instance_create_depth(_x, _y, -_y, obj_colisao);
}

var _col = instance_place(x, y, obj_colisao);
if (_col) instance_destroy(_col);

if (keyboard_check_pressed(vk_enter))
{
	view_enabled[1] = !view_enabled[1];
	view_enabled[0] = !view_enabled[0];
}