#region variaveis
caminho = path_add();
sped = 1;

vida_max = 100;
vida = 100;

timer_max = 40;
timer = timer_max;
dano = 10;
#endregion

f_movimento = function()
{
	var x1 = x;
	var y1 = y;
	desx = instance_exists(obj_tower)? obj_tower.x : x;
	desy = instance_exists(obj_tower)? obj_tower.y : y;
	
	if (mp_grid_path(obj_grid.grid, caminho, x1, y1, desx, desy, true))
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
	if (place_meeting(x, y, obj_tower))
	{
		timer--;
		if (timer <= 0)
		{
			timer = timer_max;
			obj_tower.vida -= dano;
		}
	}
}