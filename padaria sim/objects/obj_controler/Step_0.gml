timer--;
if (timer == 0)
{
	var list = ds_list_create();
	collision_rectangle_list(0, 0, room_width, room_height, obj_cliente, false, false, list, false);
	timer = timer_max
	var _chance = irandom(200);
	if (_chance <= chance and ds_list_size(list) < qtd_max)
	{
		instance_create_layer(obj_saida.x, obj_saida.y, layer, obj_cliente);
	}
	ds_list_clear(list);
	ds_list_destroy(list);
	
	var list = ds_list_create();
	collision_rectangle_list(0, 0, room_width, room_height, obj_sujeira, false, false, list, false);
	var _chance = irandom(200);
	if (_chance <= chance_sujeira and ds_list_size(list) < qtd_max)
	{
		var _x = irandom(room_width);
		var _y = irandom(room_height);
		while(collision_point(_x, _y, obj_colisao, false, false))
		{
			var _x = irandom(room_width);
			var _y = irandom(room_height);
		}
		
		instance_create_layer(_x, _y, layer, obj_sujeira);
	}
	ds_list_clear(list);
	ds_list_destroy(list);
}