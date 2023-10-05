image_angle -= vl;
vl = lerp(vl, 0, acl);
if (vl <= .5) vl = 0;
if (vl == 0) timer--;
if (image_angle < 0) image_angle += 360;
if (timer <= 0)
{
	if (image_angle == clamp(image_angle, 0, 45))		global.ima++;
	if (image_angle == clamp(image_angle, 45, 90))		global.pontos += 150;
	if (image_angle == clamp(image_angle, 90, 135))		global.shield += 2;
	if (image_angle == clamp(image_angle, 135, 180))	global.star += 2;
	if (image_angle == clamp(image_angle, 180, 225))	global.ima += 2;
	if (image_angle == clamp(image_angle, 225, 270))	global.pontos += 200;
	if (image_angle == clamp(image_angle, 270, 315))	global.shield++;
	if (image_angle == clamp(image_angle, 315, 360))	global.star++;
	instance_destroy();
	
	ini_open("stats.ini");
	ini_write_real("stats", "pontos", global.pontos);
	ini_write_real("stats", "imã", global.ima);
	ini_write_real("stats", "escudo", global.shield);
	ini_write_real("stats", "estrela", global.star);
	ini_close()
}