var _event_id = async_load[? "id"];
if (_event_id == server)
{
	var _type = async_load[? "type"];
	var _sock = async_load[? "socket"];
	
	#region conectando
	if (_type == network_type_connect)
	{
		ds_list_add(sockets, _sock);
		var _obj = instance_create_layer(room_width/2, room_height/2+100*_sock, layer, obj_player);
		ds_map_add(clients, _sock, _obj);
		
		for (var i = 0; i < instance_number(obj_player); i++;)
		{
			var _pl = instance_find(obj_player, i);
			scr_remoteentity(_sock, CMD_X, _pl.id, _pl.x);
			scr_remoteentity(_sock, CMD_Y, _pl.id, _pl.y);
			scr_remoteentity(_sock, CMD_NAME, _pl.id, _pl.nome);
			scr_remoteentity(_sock, CMD_SPRITE, _pl.id, _pl.sprite_index);
		}
	}
	#endregion
	
	#region desconectando
	if (_type == network_type_disconnect)
	{
		var _player = clients[? "sock"];
		if (instance_exists(_player))
		{
			instance_destroy(_player);
		}
		ds_list_delete(sockets, ds_list_find_index(sockets, _sock));
		ds_map_delete(clients, _sock);
		
	}
	#endregion
}
else if (_event_id != global.socket)
{
	var _sock = async_load[? "id"];
	var _buff = async_load[? "buffer"];
	
	var _player = clients[? _sock]
	buffer_seek(_buff, buffer_seek_start, 0);
	var _cmd = buffer_read(_buff, buffer_u8);
	switch (_cmd)
	{
		case PACKET_KEY :
			with (_player)
			{
				var _k = buffer_read(_buff, buffer_u8);
				var _s = buffer_read(_buff, buffer_u8);
				keys[_k] = _s;
			}
		break;
	}
}