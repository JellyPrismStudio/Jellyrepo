draw_set_font(fnt_padrao);

#region do server
function scr_writekey(tecla, precionada)
{
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, PACKET_KEY);
	buffer_write(buffer, buffer_u8, tecla);
	buffer_write(buffer, buffer_u8, precionada);
	network_send_packet(socket, buffer, buffer_tell(buffer));
}
#endregion

#region do cliente
function scr_remoteentity(socker, index, _id, value)
{
	#macro CMD_X 0
	#macro CMD_Y 1
	#macro CMD_NAME 2
	#macro CMD_SPRITE 3
	#macro CMD_DESTROY 4
	
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, PACKET_ENTITY);
	buffer_write(buffer, buffer_u8, index);
	buffer_write(buffer, buffer_u32, _id);
	
	switch (index)
	{
		case CMD_X:
			buffer_write(buffer, buffer_s16, value);
		break;
		
		case CMD_Y:
			buffer_write(buffer, buffer_s16, value);
		break;
		
		case CMD_NAME:
			buffer_write(buffer, buffer_string, value);
		break;
		
		case CMD_SPRITE:
			buffer_write(buffer, buffer_u16, value);
		break;
		
		case CMD_DESTROY:
			buffer_write(buffer, buffer_u8, value);
		break;
	}
	network_send_packet(socker, buffer, buffer_tell(buffer));
}
#endregion