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