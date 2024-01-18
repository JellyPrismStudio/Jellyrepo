vida = 3;
sped = 1;
timer_max = 10;
timer = timer_max;
sangrando = false
timer_sangrando = global.timer_sangrando;

caminho = path_add();
dir = 0;
timer_max = 60;
timer = timer_max;

desx_ = x;
desy_ = y;

f_dano = function()
{
	var _col = instance_place(x, y, obj_player_bullet);
	if (_col)
	{
		vida--;
		instance_destroy(_col);
		if (global.sangrando) sangrando = true;
		if (global.vampirismo)
		{
			obj_player.vida += 1;
			obj_player.vida = clamp(obj_player.vida, 0, obj_player.vida_max);
		}
		var _chance = irandom_range(1, 100);
		if (_chance <= global.ricochete)
		{
			var _col = collision_circle(x, y, 500, obj_melee_base, false, true);
			if (_col)
			{
				var _obj = instance_create_depth(x, y, depth, obj_player_bullet);
				_obj.image_angle = point_direction(x, y, _col.x, _col.y);
				_obj.x += lengthdir_x( 100, _obj.image_angle);
				_obj.y += lengthdir_y( 100, _obj.image_angle);
			}
		}
	}

	if (vida <= 0) instance_destroy();
	
	if (sangrando)
	{
		timer_sangrando--;
		if (timer_sangrando == 0)
		{
			timer_sangrando = global.timer_sangrando;
			vida--;
		}
	}
}

f_move = function()
{
	if (point_distance(x, y, obj_player.x, obj_player.y) > 400)
	{
		dir = choose(-1, 1);
		var _dir = point_direction(obj_player.x, obj_player.y, x, y);
		desx = obj_player.x+lengthdir_x(350, _dir);
		desy = obj_player.y+lengthdir_y(350, _dir);
		
		if (point_distance(desx, desy, desx_, desy_) > 30)
		{
			desx_ = desx;
			desy_ = desy;
			if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true))
			{
				path_start(caminho, sped, path_action_stop, false);
			}
		}
	}

	if (point_distance(x, y, obj_player.x, obj_player.y) < 400 and point_distance(x, y, desx, desy) < 5)
	{
		var _dir = point_direction(obj_player.x, obj_player.y, x, y);
		_dir += dir*15;
		desx = obj_player.x+lengthdir_x(350, _dir);
		desy = obj_player.y+lengthdir_y(350, _dir);
	
		if (mp_grid_path(obj_grid.grid, caminho, x, y, desx, desy, true))
		{
			path_start(caminho, sped, path_action_stop, false);
		}
	}
}

f_tiro = function()
{
	if (point_distance(x, y, obj_player.x, obj_player.y) < 700)
	{
		timer--;
		if (timer == 0)
		{
			timer = timer_max;
			var _obj = instance_create_depth(x, y, depth, obj_enemy_bullet);
			_obj.image_angle = point_direction(x, y, obj_player.x, obj_player.y);
		}
	}
}