/// @description ss_pistol()
function ss_pistol() {
	shooting_posdir(8,16)
	var n;
	n = instance_create(x + cx,y + cy,obj_bullet_pistol)
	n.z = z + cz + zheight*0.6
	n.xspeed = xsp
	n.yspeed = ysp
	n.zspeed = zsp
	sfx(snd_shoot_pistol)



}
