event_inherited();
estado = "esperando";
obj = noone
sped = 5;
caminho = path_add();
item = noone;
timer_max = 1200;
timer_max_folga = 600;
timer = timer_max;

var _list = ds_list_create();
collision_rectangle_list(0, 0, room_width, room_height, obj_repositor, false, true, _list, false);
idd = ds_list_size(_list);
ds_list_clear(_list);
ds_list_destroy(_list);
quantidade = 0;

nomes = ["Zé du Café", "Clebin", "Jubscresvaldison", "Chapolin", "Tripa seca"]

f_teste = function()
{
	if (instance_exists(obj_sujeira))
	{
		var _list = ds_list_create();
		collision_rectangle_list(0, 0, room_width, room_height, obj_sujeira, false, true, _list, false);
		obj = ds_list_find_value(_list, 0);
		estado = "limpando";
		ds_list_clear(_list);
		ds_list_destroy(_list);
	}
}

f_limpando = function()
{
	var _list = ds_list_create();
	collision_rectangle_list(0, 0, room_width, room_height, obj_sujeira, false, true, _list, true);
	obj = ds_list_find_value(_list, 0);
	ds_list_clear(_list);
	ds_list_destroy(_list);
	
	var x1 = x;
	var y1 = y;
	desx = obj.x;
	desy = obj.y;
		
	if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj_sujeira, false, false))
	{
		estado = "limpando2";
		desx = x;
		desy = y;
		obj.limpando = true;
		obj.timer = 60;
		obj.timer_max = 60;
		global.e_xp[idd]++;
	}
	
	if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
}

f_state_machine = function()
{
	if  (timer > 0) timer--;
	switch (estado)
	{
		case "esperando":
			f_teste();
			if (timer == 0)
			{
				estado = "folga";
				timer = timer_max_folga;
				desx = x;
				desy = y;
			}
		break;
		
		case "limpando":
			f_limpando();
		break;
		
		case "limpando2":
			if (obj.timer == 1) estado = "esperando";
		break;
		
		case "folga":
			var x1 = x;
			var y1 = y;
			if (mp_grid_path(obj_grid.grid, caminho, x1, y1, 50, 50, true))
			{
				path_start(caminho, sped, path_action_stop, false)
			}
			if (timer == 0)
			{
				estado = "trabalhando";
				timer = timer_max;
			}
		break;
		
		case "trabalhando":
			var x1 = x;
			var y1 = y;
			if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
			{
				path_start(caminho, sped, path_action_stop, false)
			}
			if (x == clamp(x, desx-5, desx+5) and y == clamp(y, desy-5, desy+5)) estado = "esperando";
		break;
	}
}