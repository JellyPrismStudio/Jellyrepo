timer--;
if (timer == 0) image_alpha = 1;

if (image_alpha == 1)
{
	if (mp_grid_path(obj_grid.grid, caminho, x, y, obj_armazem.x, obj_armazem.y, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
	if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj_armazem, false, false))
	{
		image_alpha = 2;
		for (var i = 0; i < array_length(itens); i++;)
		{
			global.p_quantidade[itens[i]] += 1;
		}
	}
}

if (image_alpha == 2)
{
	if (mp_grid_path(obj_grid.grid, caminho, x, y, obj_saida.x, obj_saida.y, true))
	{
		path_start(caminho, sped, path_action_stop, false)
	}
	if (collision_rectangle(x-sprite_width/2-sped, y-sprite_height/2-sped, x+sprite_width/2+sped, y+sprite_height/2+sped, obj_saida, false, false))
	{
		instance_destroy();
	}
}