depth = -y;

if !conf == global.config.GPU.wobble{
	if global.config.GPU.wobble image_speed = random_range(0.6,1.3);
	else image_speed = 0;
	conf = global.config.GPU.wobble;
}