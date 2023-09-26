start_speed = layer_get_vspeed("fundo");

#region obstaculos
#region variaveis
timer_max = 60;
timer = timer_max;
timer_range = 20;
#endregion
f_obstaculo = function()
{
	var _obstaculo = choose(obj_obstaculo1, obj_obstaculo1, obj_obstaculo1, obj_obstaculo2, obj_obstaculo2);
	return _obstaculo;
}

f_geracao = function()
{
	timer--;
	if (timer <= 0)
	{
		timer = timer_max+irandom_range(-timer_range, timer_range);
		//chance de gerar 3 obstaculos baixos (1/10)
		var _chance = irandom(15);
		if (_chance < 15)
		{
			//chance de gerar 2 obstaculos duma vez (1/3)
			_chance_ = choose(false, false, true);
			var _posicao = irandom_range(-1, 1);
			//
			instance_create_layer(room_width/2+_posicao*room_width/3, -100, layer, f_obstaculo());
			if (_chance_)
			{
				var _posicao2;
				if (_posicao == -1) _posicao2 = choose(0, 1);
				if (_posicao == 0) _posicao2 = choose(-1, 1);
				if (_posicao == 1) _posicao2 = choose(-1, 0);
		
				instance_create_layer(room_width/2+_posicao2*room_width/3, -100, layer, f_obstaculo());
			}
		}
		else
		{
			for (var i = -1; i < 2; i++)
			{
				instance_create_layer(room_width/2+i*room_width/3, -100, layer, obj_obstaculo1);
			}
		}
	}
}
#endregion

#region vida
#region variaveis
timer_vida_max = 240;
timer_vida = timer_vida_max;
#endregion

f_vida = function()
{
	if (obj_player.vida != 2)
	{
		timer_vida--;
		if (timer_vida <= 0 and timer <= 1)
		{
			var _posicao = irandom_range(-1, 1);
			instance_create_layer(room_width/2+_posicao*room_width/3, -100, layer, obj_vida);
			timer_vida = timer_vida_max*layer_get_vspeed("fundo")/start_speed;
		}
	}
	else timer_vida = timer_vida_max*layer_get_vspeed("fundo")/start_speed;
}
#endregion

#region velocidade
f_speed_add = function()
{
	var _vsped = layer_get_vspeed("fundo");
	layer_vspeed("fundo", _vsped+.001*_vsped/start_speed);
}
#endregion