points++;
if (points == 600*level+600)
{
	level++;
	points = 0
	timer_max = ceil(timer_max_max/(level/2));
	instance_create_depth(0, 0, 0, obj_up);
}

timer--;
if (timer == 0)
{
	timer = timer_max;
	repeat (3)
	{
		var _dir = irandom(360);
		var _enm = irandom_range(0, array_length(level_enemys[level])-1);
		instance_create_depth(obj_player.x+lengthdir_x(800, _dir), obj_player.y+lengthdir_y(800, _dir), depth, level_enemys[level, _enm]);
	}
}

if (level == 10)
{
	show_message("fim")
	game_end();
}

if (keyboard_check_pressed(ord("L"))) level++;