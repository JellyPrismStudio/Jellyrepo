timer_max = 900;
timer = timer_max;
dia = true;
alpha_max = .7;
alpha = 0;

randomize();
repeat (random_range(7, 15))
{
	var _x = random(room_width);
	var _y = random(room_height);
	instance_create_depth(_x, _y, -_y, obj_pedra);
}