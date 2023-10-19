#region variaveis
caminho = path_add();
sped = 1;
desx = x;
desy = y;

vida_max = 70;
vida = 70;

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
	
	desx = instance_exists(obj_final)? obj_final.x : x;
	desy = instance_exists(obj_final)? obj_final.y : y;
	
	if (mp_grid_path(obj_grid.grid, caminho, _x1, _y1, desx, desy, true))
	{
		path_start(caminho, sped*global.game_speed, path_action_stop, false)
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