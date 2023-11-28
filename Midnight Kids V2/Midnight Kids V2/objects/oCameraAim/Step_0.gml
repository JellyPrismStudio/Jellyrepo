
if _GLOBAL_CAMERA.camera < array_length(global.intern.enemyover) 
{
	if instance_exists(global.intern.enemyover[_GLOBAL_CAMERA.camera]) and _GLOBAL_CAMERA.customtarget
	{
		x = global.intern.enemyover[_GLOBAL_CAMERA.camera].x;
		y = global.intern.enemyover[_GLOBAL_CAMERA.camera].y - global.intern.enemyover[_GLOBAL_CAMERA.camera].sprite_height;
	}
	else {
		instance_destroy();
	}
}
if global.onmenu or global.on_message image_alpha = 0
else image_alpha = 1