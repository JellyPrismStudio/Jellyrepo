switch (estado)
{
	#region comprando
	case "comprando":
	if (instance_exists(obj_balcao))
	{
		var x1 = x;
		var y1 = y;
		desx = obj_balcao.x;
		desy = obj_balcao.y;
		
		if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj_balcao, false, false))
		{
			estado = "pensando";
			desx = x;
			desy = y;
		}
		
		if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
		{
			path_start(caminho, sped, path_action_stop, false)
		}
	}
	break;
	#endregion
	
	#region pensando
	case "pensando":
		if (timer == 0) timer = timer_max;
		timer--;
		if (timer == 0)
		{
			estado = "saindo";
			for (var i = 0; i < 5; i++;)
			{
				if (dinheiro >= obj_balcao.comidas[1, i])
				{
					var _chance = irandom(10);
					if (_chance < 7)
					{
						dinheiro -= obj_balcao.comidas[1, i];
						show_message(obj_balcao.comidas[0, i]);
						break;
					}
				}
			}
		}
	break;
	#endregion
	
	#region saindo
	case "saindo":
	if (instance_exists(obj_balcao))
	{
		var x1 = x;
		var y1 = y;
		desx = obj_saida.x;
		desy = obj_saida.y;
	
		if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
		{
			path_start(caminho, sped, path_action_stop, false)
		}
		if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj_saida, false, false))
		{
			instance_destroy();
		}
	}
	break;
	#endregion
}