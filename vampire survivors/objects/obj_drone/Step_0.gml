if (point_distance(x, y, obj_player.x, obj_player.y) > 100)
{
	x = lerp(x, obj_player.x, .01);
	y = lerp(y, obj_player.y, .01);
}

timer--;
if (timer == 0)
{
	timer = timer_max;
	var _col = collision_circle(x, y, 500, obj_melee_base, false, true);
	if (_col)
	{
		var _obj = instance_create_depth(x, y, depth, obj_player_bullet);
		_obj.image_angle = point_direction(x, y, _col.x, _col.y);
	}
}