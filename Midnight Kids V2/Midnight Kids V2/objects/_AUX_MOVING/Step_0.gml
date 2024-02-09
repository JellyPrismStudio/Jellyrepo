	if variable_instance_exists(instanceid, "customspr") instanceid.customspr = true;
	if xdir != 1 and xdir != -1
	{
		 if dir == "right" or dir == "up" {
			 _intern_graphic(instanceid, sprite, 1);
		 }		 
		 else if dir == "left" or dir == "down"{
			 _intern_graphic(instanceid, sprite, -1); 
		 }
		 else _intern_graphic(instanceid, sprite, 1);
	}
	else _intern_graphic(instanceid, sprite, xdir);
	
	if	_local1 - spd > 0
	{	
		if dir == "downleft"	or dir == 1			{	instanceid.y += spd/2 ; instanceid.x -= spd/2;	}
		if dir == "down"		or dir == 2										instanceid.y += spd
		if dir == "downright"	or dir == 3			{	instanceid.y += spd/2 ; instanceid.x += spd/2;	}
		if dir == "left"		or dir == 4										instanceid.x -= spd
		if dir == "right"		or dir == 6										instanceid.x += spd
		if dir == "upleft"		or dir == 7			{	instanceid.y -= spd/2 ; instanceid.x -= spd/2;	}
		if dir == "up"			or dir == 8										instanceid.y -= spd
		if dir == "upright"		or dir == 9			{	instanceid.y -= spd/2 ; instanceid.x += spd/2;	}	
		_local1 -= spd;
	}
	else
	{
		if dir == "downleft"	or dir == 1			{	instanceid.y += _local1/2 ; instanceid.x -= _local1/2;	}
		if dir == "down"		or dir == 2											instanceid.y += _local1
		if dir == "downright"	or dir == 3			{	instanceid.y += _local1/2 ; instanceid.x += _local1/2;	}
		if dir == "left"		or dir == 4											instanceid.x -= _local1
		if dir == "right"		or dir == 6											instanceid.x += _local1
		if dir == "upleft"		or dir == 7			{	instanceid.y -= _local1/2 ; instanceid.x -= _local1/2;	}
		if dir == "up"			or dir == 8											instanceid.y -= _local1
		if dir == "upright"		or dir == 9			{	instanceid.y -= _local1/2 ; instanceid.x += _local1/2;	}
		_local1 = -1
		if variable_instance_exists(instanceid, "customspr") instanceid.customspr = false;
		_intern_graphic(instanceid, initsprite, 1);
		//if check_instances_for_variable(_AUX_MOVING, "instanceid", instanceid)
		//{
			instance_destroy();		
		//}
	}
sdm(id, _local1, length);