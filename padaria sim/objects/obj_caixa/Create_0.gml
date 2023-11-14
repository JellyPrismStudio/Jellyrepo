event_inherited();

list = ds_list_create();
timer_max = 120;
timer = 120;

f_pagando = function()
{
	if (ds_list_size(list) >= 1)
	{
		timer--;
		if (timer == 0)
		{
			timer = timer_max;
			var _obj = ds_list_find_value(list, 0);
			_obj.estado = "saindo";
			global.gold += _obj.devendo;
			_obj.devendo = 0;
			ds_list_delete(list, 0);
		}
	}
}