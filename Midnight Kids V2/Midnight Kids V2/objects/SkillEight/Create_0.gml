repeat (30)
{
	var tachinha = instance_create_depth(x, y, depth, obj_tachinha);
	tachinha.direction = random(360);
	tachinha.speed = random(5);
}