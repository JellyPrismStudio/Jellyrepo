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
}