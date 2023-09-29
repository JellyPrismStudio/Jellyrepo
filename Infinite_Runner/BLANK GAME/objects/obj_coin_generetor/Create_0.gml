#region movimento
posicao = 0;
f_movimento = function()
{
	if (position_meeting(x, -200, obj_obstaculo2))
	{
		if (posicao == -1)
		{
			if (!position_meeting(room_width/2 + (posicao+1)*room_width/3, -200, obj_obstaculo2)) posicao = 0;
			else if (!position_meeting(room_width/2 + (posicao+2)*room_width/3, -200, obj_obstaculo2)) posicao = 1;
		}
		if (posicao == 0)
		{
			if (!position_meeting(room_width/2 + (posicao-1)*room_width/3, -200, obj_obstaculo2) and
			!position_meeting(room_width/2 + (posicao+1)*room_width/3, -200, obj_obstaculo2)) posicao = choose(-1, 1);
			else if (!position_meeting(room_width/2 + (posicao-1)*room_width/3, -200, obj_obstaculo2)) posicao = -1;
			else if (!position_meeting(room_width/2 + (posicao+1)*room_width/3, -200, obj_obstaculo2)) posicao = 1;
		}
		if (posicao == 1)
		{
			if (!position_meeting(room_width/2 + (posicao-1)*room_width/3, -200, obj_obstaculo2)) posicao = 0;
			else if (!position_meeting(room_width/2 + (posicao-2)*room_width/3, -200, obj_obstaculo2)) posicao = -1;
		}
		
		x = room_width/2 + posicao*room_width/3;
	}
}
#endregion

#region geracao
timer_max = 50*layer_get_vspeed("fundo")/3;
timer = 600;

f_geracao = function()
{
	timer--;
	if (timer <= 0)
	{
		timer = timer_max;
		var _chance = irandom(40);
		if (_chance == 40) instance_create_layer(x, -130, layer, obj_escudo);
		if (_chance == 39) instance_create_layer(x, -130, layer, obj_estrela);
		if (_chance == 38) instance_create_layer(x, -130, layer, obj_ima);
		if (_chance < 38) instance_create_layer(x, -130, layer, obj_moeda);
		
	}
}
#endregion