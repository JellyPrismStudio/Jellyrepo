var _event_id = async_load[? "id"];

if (socket == _event_id)
{
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _cmd = buffer_read(_buff, buffer_u8);
	switch(_cmd)
	{
		case PACKET_ENTITY:
			var c = buffer_read(_buff, buffer_u8);
			var e_id = buffer_read(_buff, buffer_u32);
			
			if (!ds_map_exists(entities, e_id))
			{
				var _player = instance_create_layer(room_width/2, room_height/2, layer, obj_entity);
				ds_map_set(entities, e_id, _player);
			}
			
			var _player = entities[? e_id];
			switch (c)
			{
				case CMD_X:
					_player.x = buffer_read(_buff, buffer_s16);
				break;
		
				case CMD_Y:
					_player.y = buffer_read(_buff, buffer_s16);
				break;
		
				case CMD_NAME:
					_player.nome = buffer_read(_buff, buffer_string);
				break;
		
				case CMD_SPRITE:
					_player.sprite_index = buffer_read(_buff, buffer_u16);
				break;
		
				case CMD_DESTROY:
					buffer_read(_buff, buffer_u8);
					ds_map_delete(entities, e_id)
					instance_destroy(_player);
				break;
			}
		break;
	}
}