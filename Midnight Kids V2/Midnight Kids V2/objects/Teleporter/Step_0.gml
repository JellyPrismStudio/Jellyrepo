if place_meeting(x,y,global.player) {
	
		object_set_persistent(TeleporterBackup,true);
		var obj = instance_create_depth(global.player.x,global.player.y,0,TeleporterBackup);
		obj.Room_Destiny = _r;
		obj.fade_speed = _fs;
		obj.obj = _obj;
		obj.xx = _xx;
		obj.yy = _yy;
		obj.validate = _validate;
		obj.freemovement = _freemovement;
		obj.activate = true;
		object_set_persistent(TeleporterBackup,false);
		instance_destroy();
}
