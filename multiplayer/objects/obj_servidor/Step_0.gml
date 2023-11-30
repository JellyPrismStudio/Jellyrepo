for (var i = 0; i < instance_number(obj_player); i++;)
{
	var _pl = instance_find(obj_player, i);
	for (var j = 0; j < ds_list_size(sockets); j++)
	{
		var so = ds_list_find_value(sockets, j);
		scr_remoteentity(so, CMD_X, _pl.id, _pl.x);
		scr_remoteentity(so, CMD_Y, _pl.id, _pl.y);
	}
}