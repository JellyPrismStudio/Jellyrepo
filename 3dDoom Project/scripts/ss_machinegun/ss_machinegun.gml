/// @description ss_pistol()
function ss_machinegun() {
	shooting_posdir(8,14)
	var n;
	n = instance_create(x + cx,y + cy,obj_bullet_machinegun)
	n.z = z + cz + zheight*0.6
	n.xspeed = xsp + random_range(-1,1)
	n.yspeed = ysp + random_range(-1,1)
	n.zspeed = zsp + random_range(-1,1)
	sfx(snd_shoot_machinegun)



}
