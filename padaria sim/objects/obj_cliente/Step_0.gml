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
			
			if (array_length(_balcao.comidas[0]) == 0)
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
			for (var i = 0; i < array_length(_balcao.comidas[0]); i++;)
			{
				if (item == noone)
				{
					repeat (3)
					{
						if (dinheiro >= _balcao.comidas[1, i])
						{
							var _chance = irandom(10);
							if (_chance < 4)
							{
								var _dinheiro = dinheiro;
								dinheiro -= _balcao.comidas[1, i];
								global.c_xp[cliente]++;
								global.xp += 10;
								global.gold += _dinheiro-dinheiro;
								global.c_dinheiro[cliente] += _dinheiro-dinheiro;
								global.p_dinheiro[_balcao.comidas[2, i]] += _dinheiro-dinheiro;
								global.p_compras[_balcao.comidas[2, i]]++;
								xp++;
								inventario[invt, 0] = _balcao.comidas[0, i];
								inventario[invt, 1] = _balcao.comidas[2, i];
								invt++;
								if (_balcao.comidas[3, i] > 1) _balcao.comidas[3, i]--;
								else
								{
									for (var j = i; j < array_length(_balcao.comidas[0])-1; j++;)
									{	
										_balcao.comidas[0, j] = _balcao.comidas[0, j+1];
										_balcao.comidas[1, j] = _balcao.comidas[1, j+1];
										_balcao.comidas[2, j] = _balcao.comidas[2, j+1];
										_balcao.comidas[3, j] = _balcao.comidas[3, j+1];
									}
									array_resize(_balcao.comidas[0], array_length(_balcao.comidas[0])-1);
									array_resize(_balcao.comidas[1], array_length(_balcao.comidas[1])-1);
									array_resize(_balcao.comidas[2], array_length(_balcao.comidas[2])-1);
									break;
								}
								show_message(nomes[cliente] + " comprou " + _balcao.comidas[0, i] + " por " + string(_balcao.comidas[1, i]) + " reais");
							}
						}
					}
					
					if (dinheiro >= _balcao.comidas[1, i])
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
							var _dinheiro = dinheiro;
							dinheiro -= _balcao.comidas[1, i];
							estado = "saindo";
							global.c_xp[cliente]++;
							global.gold += _dinheiro-dinheiro;
							global.p_dinheiro[_balcao.comidas[2, i]] += _dinheiro-dinheiro;
							global.p_compras[_balcao.comidas[2, i]]++;
							xp++;
							global.xp += 10;
							inventario[invt, 0] = _balcao.comidas[0, i];
							inventario[invt, 1] = _balcao.comidas[2, i];
							invt++;
							global.p_dinheiro[i] += _dinheiro-dinheiro;
							if (_balcao.comidas[3, i] > 1) _balcao.comidas[3, i]--;
							else
							{
								for (var j = i; j < array_length(_balcao.comidas[0])-1; j++;)
								{	
									_balcao.comidas[0, j] = _balcao.comidas[0, j+1];
									_balcao.comidas[1, j] = _balcao.comidas[1, j+1];
									_balcao.comidas[2, j] = _balcao.comidas[2, j+1];
									_balcao.comidas[3, j] = _balcao.comidas[3, j+1];
								}
								array_resize(_balcao.comidas[0], array_length(_balcao.comidas[0])-1);
								array_resize(_balcao.comidas[1], array_length(_balcao.comidas[1])-1);
								array_resize(_balcao.comidas[2], array_length(_balcao.comidas[2])-1);
								break;
							}
							show_message(nomes[cliente] + " comprou " + _balcao.comidas[0, i] + " por " + string(_balcao.comidas[1, i]) + " reais");
							
							repeat (2)
							{
								if (dinheiro >= _balcao.comidas[1, i])
								{
									var _chance = irandom(10);
									if (_chance < 4)
									{
										var _dinheiro = dinheiro;
										dinheiro -= _balcao.comidas[1, i];
										estado = "saindo";
										global.c_xp[cliente]++;
										global.gold += _dinheiro-dinheiro;
										global.c_dinheiro[cliente] += _dinheiro-dinheiro;
										global.p_dinheiro[_balcao.comidas[2, i]] += _dinheiro-dinheiro;
										global.p_compras[_balcao.comidas[2, i]]++;
										xp++;
										global.xp += 10;
										inventario[invt, 0] = _balcao.comidas[0, i];
										inventario[invt, 1] = _balcao.comidas[2, i];
										invt++;
										if (_balcao.comidas[3, i] > 1) _balcao.comidas[3, i]--;
										else
										{
											for (var j = i; j < array_length(_balcao.comidas[0])-1; j++;)
											{	
												_balcao.comidas[0, j] = _balcao.comidas[0, j+1];
												_balcao.comidas[1, j] = _balcao.comidas[1, j+1];
												_balcao.comidas[2, j] = _balcao.comidas[2, j+1];
												_balcao.comidas[3, j] = _balcao.comidas[3, j+1];
											}
											array_resize(_balcao.comidas[0], array_length(_balcao.comidas[0])-1);
											array_resize(_balcao.comidas[1], array_length(_balcao.comidas[1])-1);
											array_resize(_balcao.comidas[2], array_length(_balcao.comidas[2])-1);
											break;
										}
										show_message(nomes[cliente] + " comprou " + _balcao.comidas[0, i] + " por " + string(_balcao.comidas[1, i]) + " reais");
									}
								}
							}
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
		}
	}
	break;
	#endregion
}

if (xp == level[lvl]) lvl++;

if (collision_point(mouse_x, mouse_y, self, false, false) and mouse_check_button_pressed(mb_left))
{
	var _obj = instance_create_depth(0, 0, 0, obj_painel);
	_obj.obj = self;
}