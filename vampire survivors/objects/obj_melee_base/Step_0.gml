var _col = instance_place(x, y, obj_player_bullet);
if (_col)
{
	vida--;
	instance_destroy(_col);
	if (global.sangrando) sangrando = true;
	if (global.vampirismo)
	{
		obj_player.vida += 1;
		obj_player.vida = clamp(obj_player.vida, 0, obj_player.vida_max);
	}
	var _chance = irandom_range(1, 100);
	if (_chance <= global.ricochete)
	{
		var _col = collision_circle(x, y, 500, obj_melee_base, false, true);
		if (_col)
		{
			var _obj = instance_create_depth(x, y, depth, obj_player_bullet);
			_obj.image_angle = point_direction(x, y, _col.x, _col.y);
			_obj.x += lengthdir_x( 100, _obj.image_angle);
			_obj.y += lengthdir_y( 100, _obj.image_angle);
		}
	}
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

if (sangrando)
{
	timer_sangrando--;
	if (timer_sangrando == 0)
	{
		timer_sangrando = global.timer_sangrando;
		vida--;
	}
}