if _GLOBAL_CAMERA.camera < array_length(global.intern.enemyover){
	if global.config.autoaim and global.intern.enemyover[_GLOBAL_CAMERA.camera] != noone and instance_exists(global.intern.enemyover[_GLOBAL_CAMERA.camera]) and global.config.autoaim
	{
		fx = global.intern.enemyover[_GLOBAL_CAMERA.camera].x;
		fy = global.intern.enemyover[_GLOBAL_CAMERA.camera].y;
		dir = point_direction(x,y,fx,fy);
	}
	else
	{
		dir = point_direction(x,y,mouse_x,mouse_y);
		fx = mouse_x
		fy = mouse_y;
	}
}
else
{
	dir = point_direction(x,y,mouse_x,mouse_y);
	fx = mouse_x
	fy = mouse_y;
}

class = 1;
deal_damage = true;
direction = dir;
image_angle = dir;
speed = 15;
super = noone;
life = irandom_range(30,220);
xx = (fx - x);
yy = (fy - y);
life = sqrt(	power(xx,2) + power(yy,2)	)

crit = global.player_stats[2].crit;
atack = global.player_stats[2].atack;
hitrate = global.player_stats[2].hitrate
hitted = false