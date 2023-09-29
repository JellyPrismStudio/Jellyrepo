#region colisão com obstaculo
f_place_obstacle = function()
{
	if (!player)
	{
		var _colisao = instance_place(x, y, obj_obstaculo2);
		if (_colisao) instance_destroy(_colisao);
		_colisao = instance_place(x, y, obj_obstaculo1);
		if (_colisao) instance_destroy(_colisao);
	}
}

#endregion

#region player
player = false;
//a velocidade que a moeda se aproxima do player
speed_coin = .3;
f_player = function()
{
	if (place_meeting(x, y, obj_player) and !player)
	{
		timer = 60*15;
		player = true;
	}
	if (player)
	{
		x = obj_player.x;
		y = obj_player.y-45;
		
		timer--;
		if (timer == 0) instance_destroy();
		image_alpha = timer/60/15+.2;
		
		var _col = collision_rectangle(0, y+100, room_width, y-100, obj_moeda, false, true);
		if (_col)
		{
			_col.x = lerp(_col.x, obj_player.x, speed_coin);
			_col.y = lerp(_col.y, obj_player.y, speed_coin);
		}
	}
}
#endregion