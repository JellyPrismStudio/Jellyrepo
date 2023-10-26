switch (estado)
{
	#region comprando
	case "comprando":
	var _balcao = ds_list_find_value(list, pos);
	if (instance_exists(_balcao))
	{
		var x1 = x;
		var y1 = y;
		desx = _balcao.x;
		desy = _balcao.y;
		
		if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, _balcao, false, false))
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
			var _balcao = ds_list_find_value(list, pos);
			for (var i = 0; i < array_length(_balcao.comidas[0]); i++;)
			{
				if (item == noone)
				{
					if (dinheiro >= _balcao.comidas[1, i])
					{
						var _chance = irandom(10);
						if (_chance < 4)
						{
							dinheiro -= _balcao.comidas[1, i];
							estado = "saindo";
							global.c_xp[cliente]++;
							xp++;
							break;
						}
					}
					
					if (i == array_length(_balcao.comidas[0])-1 and estado == "pensando")
					{
						if (pos < ds_list_size(list)-1)
						{
							pos++;
							estado = "comprando";
							break;
						}
						else
						{
							estado = "saindo";
							break;
						}
					}
				}
				if (item != noone)
				{
					if (item == _balcao.comidas[0, i])
					{
						if (dinheiro >= _balcao.comidas[1, i])
						{
							dinheiro -= _balcao.comidas[1, i];
							estado = "saindo";
							global.c_xp[cliente]++;
							xp++;
							break;
						}
						else
						{
							estado = "saindo";
							break;
						}
					}
					
					if (i == array_length(_balcao.comidas[0])-1 and estado == "pensando")
					{
						if (pos < ds_list_size(list)-1)
						{
							pos++;
							estado = "comprando";
							break;
						}
						else
						{
							estado = "saindo";
							break;
						}
					}
				}
			}
		}
	break;
	#endregion
	
	#region saindo
	case "saindo":
	if (instance_exists(obj_saida))
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
			global.xp += 10;
		}
	}
	break;
	#endregion
}