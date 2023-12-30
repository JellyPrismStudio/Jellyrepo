depth = -y;
visible = true;
if (place_meeting(x, y, casa) and !obj_controler.dia) visible = false;

var _chance = irandom(300)
if (_chance == 1)
{
	desx = x+irandom_range(-500, 500)
	desy = y+irandom_range(-500, 500)
	desx = clamp(desx, sprite_width/2, room_width-sprite_width/2);
	desy = clamp(desy, sprite_height, room_height)
}

if (!obj_controler.dia and instance_exists(casa))
{
	desx = casa.x;
	desy = casa.y;
}

if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true))
{
	path_start(caminho, sped, path_action_stop, false);
}