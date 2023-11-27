x = global.player.x
y = global.player.y - 20
x0 = x;
y0 = y;
sdm("Created");

if global.config.autoaim and _GLOBAL_CAMERA.camera < array_length(global.intern.enemyover) and global.intern.enemyover[_GLOBAL_CAMERA.camera] != noone  and instance_exists(global.intern.enemyover[_GLOBAL_CAMERA.camera]) and global.config.autoaim
{
	x1 = global.intern.enemyover[_GLOBAL_CAMERA.camera].x;
	y1 = global.intern.enemyover[_GLOBAL_CAMERA.camera].y;
}
else
{
	x1 = mouse_x;
	y1 = mouse_y;
}
vel = 21;
class = 0;
points = 170;
point = 0;
pointincr = 1/points;
length = 0;
yy = 0;
yincr = 0;

xmult = (x1 - x0) / points;
ymult = (y1 - y0) / points;

bol = false;