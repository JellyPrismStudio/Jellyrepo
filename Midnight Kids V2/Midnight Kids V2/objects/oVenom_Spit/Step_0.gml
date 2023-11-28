/// @description Insert description here
if target > -1
{
	fx = global.party.playersobj[target].x;
	fy = global.party.playersobj[target].y;
}
else
{
	fx = irandom_range(0,room_width);
	fy = irandom_range(0,room_height);
}
dir = point_direction(x,y,fx,fy);
direction = dir;
image_angle = dir;
speed = 5;


dmg = global.enemy_stats[super.myid].magic;
if life <= 0 {
	oGround = instance_create_layer(x,y,"SystemInstances",oVenom_Ground);
	oGround.dmg = dmg;
	instance_destroy();
}
life -= speed;
// You can write your code in this editor


