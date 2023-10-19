#region variaveis
caminho = path_add();
sped = 1;
desx = x;
desy = y;

vida_max = 100;
vida = 100;

timer_max = 90;
timer = timer_max;

timer_gold_max = 180;
timer_gold = timer_gold_max;
nivel = 0;

//é pra no primeiro frame do step fazer um negocio
create = 0;
#endregion

#region IA
f_movimento = function()
{
	var _x1 = x;
	var _y1 = y;
	if (!instance_exists(obj_tower))
	{
		desx = instance_exists(obj_final)? obj_final.x : x;
		desy = instance_exists(obj_final)? obj_final.y : y;
	}
	else
	{
		var _raio = 100;
		_col = collision_circle(x, y, _raio, obj_tower, false, true);
		while (!_col)
		{
			_col = collision_circle(x, y, _raio, obj_tower, false, true);
			_raio++;
		}
		
		desx = _col.x;
		desy = _col.y;
		
		if (_raio < 500)
		{
			timer -= global.game_speed;
			if (timer <= 0)
			{
				timer = timer_max;
				var _tiro = instance_create_layer(x, y, layer, obj_projetil_monstro);
				_tiro.image_angle = point_direction(x, y, desx, desy);
			}
		}
	}
	
	if (mp_grid_path(obj_grid.grid, caminho, _x1, _y1, desx, desy, true))
	{
		if (_raio > 500) path_start(caminho, sped*global.game_speed, path_action_stop, false);
		else path_clear_points(caminho);
	}
}

f_tiro = function()
{
	var _col = instance_place(x, y, obj_progetil);
	if (_col) vida -= 20;
	instance_destroy(_col);
	
	if (vida <= 0) instance_destroy();
}
#endregion

f_gold = function()
{
	if (!place_meeting(x, y, obj_final))
	{
		timer_gold -= global.game_speed;
		if (timer_gold <= 0)
		{
			obj_gui.gold += 10;
			timer_gold = timer_gold_max;
			nivel++;
		}
	}
}