#region variaveis
caminho = path_add();
sped = 1;
desx = x;
desy = y;

vida_max = 100;
vida = 100;

timer_max = 40;
timer = timer_max;
dano = 10;
#endregion

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
	}
	
	if (mp_grid_path(obj_grid.grid, caminho, _x1, _y1, desx, desy, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
}

f_tiro = function()
{
	var _col = instance_place(x, y, obj_progetil);
	if (_col) vida -= 20;
	instance_destroy(_col);
	
	if (vida <= 0) instance_destroy();
}

f_dano = function()
{
	var col = instance_place(x, y, obj_tower);
	if (col)
	{
		timer--;
		if (timer <= 0)
		{
			timer = timer_max;
			col.vida -= dano;
		}
	}
}