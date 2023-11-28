//if live_call() return live_result;
var vplayer = in_viewport(global.party.playersobj[0])
var venemy = in_viewport(super)
var vexists = instance_exists(super);

//sdm(in_viewport(super));

if !vplayer or !venemy or global.on_message or global.onmenu
{
	_GLOBAL_CAMERA.customtarget = false;
	_GLOBAL_CAMERA.target = global.party.playersobj[0];
	global.intern.enemyover = [];
	instance_destroy();
}

if _GLOBAL_CAMERA.camera < array_length(global.intern.enemyover) and array_length(global.intern.enemyover) != 0 and vplayer and venemy //and vexists
{
	super = global.intern.enemyover[_GLOBAL_CAMERA.camera];
	if !instance_exists(super) instance_destroy()
	else 
	{
		if instance_exists(global.player) {
			
			x = (global.player.x + super.x) / 2;
			y = (global.player.y + super.y) / 2;
			
		}
		else {
			//x = global.player.x;
			//y = global.player.y;
			instance_destroy()
		}
	}
}
else
{
	_GLOBAL_CAMERA.customtarget = false;
	_GLOBAL_CAMERA.target = global.party.playersobj[0];
	global.intern.enemyover = [];
	

	//x = global.player.x;
	//y = global.player.y;
	instance_destroy();
}

/*

//if live_call() return live_result;
sprite_index = sAim;
image_blend = c_blue;
if (instance_exists(global.player) and instance_exists(super)) and _GLOBAL_CAMERA.customtarget != 0 {
	x = (global.player.x + super.x) / 2;
	y = (global.player.y + super.y) / 2;
}
else instance_destroy()

