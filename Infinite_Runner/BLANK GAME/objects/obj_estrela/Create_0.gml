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

moeda = obj_player.pontuacao;
#endregion

#region player
player = false;
f_player = function()
{
	if (place_meeting(x, y, obj_player) and !player)
	{
		timer = 60*15;
		player = true;
	}
	if (player)
	{
		x = obj_player.x+30;
		y = obj_player.y+30;
		
		timer--;
		if (timer == 0) instance_destroy();
		image_alpha = timer/60/15+.2;
		
		if (moeda < obj_player.pontuacao) obj_player.pontuacao++;
		moeda = obj_player.pontuacao;
	}
}
#endregion