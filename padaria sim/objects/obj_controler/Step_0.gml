timer--;
if (timer == 0)
{
	timer = timer_max
	var _chance = irandom(100);
	if (_chance <= chance)
	{
		instance_create_layer(obj_saida.x, obj_saida.y, layer, obj_cliente);
	}
}