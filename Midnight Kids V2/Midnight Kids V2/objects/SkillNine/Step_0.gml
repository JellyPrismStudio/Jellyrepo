x = global.player.x;
y = global.player.y;

if (timer/20 == floor(timer/20))
{
	var tachinha = instance_create_depth(x, y, depth, obj_tachinha);
	tachinha.direction = random(360);
	tachinha.speed = random(3);
}

if (timer < 0) instance_destroy();
timer--;