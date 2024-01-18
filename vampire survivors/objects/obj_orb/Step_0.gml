dir += 1;
x = obj_player.x+lengthdir_x(150, dir);
y = obj_player.y+lengthdir_y(150, dir);

var _col = instance_place(x, y, obj_melee_base);
if (timer == 0 and _col)
{
	timer = timer_max;
	_col.vida--;
	if (global.sangrando) _col.sangrando = true;
	if (global.vampirismo)
	{
		obj_player.vida += 1;
		obj_player.vida = clamp(obj_player.vida, 0, obj_player.vida_max);
	}
}
if (timer > 0) timer--;