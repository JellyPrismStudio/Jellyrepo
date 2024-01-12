var _col = instance_place(x, y, obj_player_bullet);
if (_col)
{
	vida--;
	instance_destroy(_col);
}

if (vida <= 0) instance_destroy();

var _x = x+lengthdir_x(sped, point_direction(x, y, obj_player.x, obj_player.y));
var _y = y+lengthdir_y(sped, point_direction(x, y, obj_player.x, obj_player.y));
if (!place_meeting(_x, _y, obj_player))
{
	x = _x;
	y = _y;
}

if (place_meeting(_x, _y, obj_player))
{
	timer--;
	if (timer == 0)
	{
		timer = timer_max;
		obj_player.vida--;
	}
}