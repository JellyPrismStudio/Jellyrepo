event_inherited();
estado = "esperando";
obj = noone
sped = 5;
caminho = path_add();
item = noone;

f_teste = function()
{
	var _list = ds_list_create();
	collision_rectangle_list(0, 0, room_width, room_height, obj_balcao, false, true, _list, false);
	for ( var i = 0; i < ds_list_size(_list); i++;)
	{
		var _balcao = ds_list_find_value(_list, i)
		for (var j = 0; j < array_length(_balcao.comidas[0]); j++;)
		{
			if (_balcao.comidas[3, j] == 0)
			{
				estado = "repondo";
				obj = _balcao;
				item = j;
			}
		}
	}
	
	ds_list_clear(_list);
	ds_list_destroy(_list);
}

f_repondo = function()
{
	var x1 = x;
	var y1 = y;
	desx = obj.x;
	desy = obj.y;
		
	if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj, false, false))
	{
		estado = "esperando";
		desx = x;
		desy = y;
		if (global.p_quantidade[item] > 0)
		{
			global.p_quantidade[obj.comidas[2, item]]--;
			obj.comidas[3, item]++;
		}
	}
		
	if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
}

f_state_machine = function()
{
	switch (estado)
	{
		case "esperando":
			f_teste();
		break;
		
		case "repondo":
			f_repondo();
		break;
	}
}