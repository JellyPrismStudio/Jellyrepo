vida_max = 500;
vida = vida_max;

timer_max = 90;
timer = timer_max;
f_bala = function()
{
	var _col = collision_circle(x, y, 500, obj_monstro_base, false, true);
	if (_col)
	{
		timer -= global.game_speed;
		if (timer <= 0)
		{
			timer = timer_max;
			var _tiro = instance_create_layer(x, y-100, layer, obj_progetil);
			_tiro.image_angle = point_direction(x, y-100, _col.x, _col.y);
		}
	}
}