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

var _col = instance_place(x, y, obj_colisao);
if (_col) instance_destroy(_col);

var _raio = point_in_circle(floor((mouse_x+size/2)/size)*size, floor((mouse_y+size/2)/size)*size, x, y, raio);

if (timer > 0) timer--;
if (mouse_check_button(mb_left) and timer == 0)
{
	var _col = false;
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	for (var i = size/2; i < raio; i++;)
	{
		var _x = x+lengthdir_x(i, _dir);
		var _y = y+lengthdir_y(i, _dir);
		var _col = collision_point(_x, _y+size/2, obj_colisao, false, false);
		if (!_col) _col = collision_point(_x, _y, obj_colisao, false, false);
		if (_col) break;
	}
	if (_col)
	{
		_col.vida -= mining_damage;
		_col.timer = _col.timer_max;
		if (_col.vida <= 0)
		{
			var _x1 = floor(_col.x/16/size)*16*size;
			var _y1 = floor(_col.y/16/size)*16*size;
			var _x = (_col.x-_x1-size/2)/size;
			var _y = (_col.y-_y1-size/2)/size*16;
			var _pos = _x+_y;
			ds_list_set(global.chunks[_x1/size/16+1, _y1/size/16+1], _pos, 0);
			instance_destroy(_col);
		}
	}
	timer = timer_max;
}

var _dir = point_direction(x, y, mouse_x, mouse_y);

image_xscale = 1;
if (_dir == clamp(_dir, 0, 45) or _dir == clamp(_dir, 315, 360) or _dir == clamp(_dir, 135, 225)) sprite_index = spr_player_side;
if (_dir == clamp(_dir, 135, 225)) image_xscale = -1;
if (_dir == clamp(_dir, 45, 135)) sprite_index = spr_player_up;
if (_dir == clamp(_dir, 225, 315)) sprite_index = spr_player_dwn;

var _dis = point_distance(x, y, mouse_x, mouse_y);
var _moux = x+lengthdir_x(clamp(_dis, 0, size*3.5), _dir);
var _mouy = y+lengthdir_y(clamp(_dis, 0, size*3.5), _dir);
var _x = floor((_moux)/size)*size+size/2;
var _y = floor((_mouy)/size)*size+size/2;
if (mouse_check_button_pressed(mb_right) and !collision_rectangle(_x-size/2+2, _y-size/2+2, _x+size/2-2, _y+size/2-2, obj_colisao, false, false))
{
	var _x1 = floor(_x/16/size)*16*size;
	var _y1 = floor(_y/16/size)*16*size;
	var _x_ = (_x-_x1-size/2)/size;
	var _y_ = (_y-_y1-size/2)/size*16;;
	var _pos = _x_+_y_;
	ds_list_set(global.chunks[_x1/size/16+1, _y1/size/16+1], _pos, 1);
	instance_create_depth(_x, _y, -_y, obj_colisao);
}