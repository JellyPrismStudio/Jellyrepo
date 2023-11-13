randomize();
sped = 3;
caminho = path_add();
cliente = irandom(10);

nomes = ["Juca", "Joao", "Maria", "Jossoares", "Viniccius13", "Jubscresvauda", "Paulinha", "James da salada de fruta", "zézinha", "Ana Maria Braga", "Silvio Santos"];
idades = ["15", "72", "pi", "178", "28", "45", "-10", "43", "25", "39", "\∞"];
genero = ["m", "m", "f", "m", "m", "f", "f", "m", "f", "f", "m"];
xp = global.c_xp[cliente];

start_money = irandom_range(xp+1, 10+xp);
dinheiro = start_money;

estado = "comprando";

timer_max = 60;
timer = 0;

item = choose("bolo", "pão", "pão de forma", "presunto", "queijo", "torta", "pastel", noone, noone);
list = ds_list_create();
pos = 0;
collision_rectangle_list(0, 0, room_width, room_height, obj_balcao, false, true, list, false);

level = [10, 30, 70, 160];
lvl = 0;

inventario[0, 0] = "";
inventario[0, 1] = 0;
invt = 0;

f_state_machine = function()
{
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
				#region saindo caso ñ tenha itens no balcão
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
				#endregion
				for (var i = 0; i < array_length(_balcao.comidas[0]); i++;)
				{
					#region caso o cliente ñ tenha nenhum item em mente
					if (item == noone)
					{
						#region caso o cliente tenha dinheiro o suficiente, pode comprar o item d 0 a 3 vezes
						repeat (3)
						{
							if (dinheiro >= _balcao.comidas[1, i] and _balcao.comidas[3, i] > 0)
							{
								var _chance = irandom(10);
								if (_chance < 5)
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
									_balcao.comidas[3, i]--;
								}
							}
						}
						#endregion
						
						#region saindo
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
						#endregion
					}
					#endregion
					
					#region caso o cliente tenha algum item em mente
					if (item != noone)
					{
						if (item == _balcao.comidas[0, i])
						{
							if (dinheiro >= _balcao.comidas[1, i] and _balcao.comidas[3, i] > 0)
							{
								#region comprando o item
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
								_balcao.comidas[3, i]--;
								#endregion
								
								#region 3/10 d chance do cliente comprar 2 vezes o item, e 1/10 de comprar 3 vezes
								repeat (2)
								{
									if (dinheiro >= _balcao.comidas[1, i] and _balcao.comidas[3, i] > 0)
									{
										var _chance = irandom(10);
										if (_chance < 4)
										{
											#region comprando o item de novo
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
											_balcao.comidas[3, i]--;
											#endregion
										}
									}
								}
								#endregion
								break;
							}
							else
							{
								estado = "saindo";
								break;
							}
						}
						
						#region código do cliente ir para outro balcão ou sair caso já tenha ido em todos
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
						#endregion
					}
					#endregion
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
}