#region variaveis
posicao = 0;
posicao_mouse_x = mouse_x;
posicao_mouse_y = mouse_y;
movendo = true;
mouse_margem = 30;

hsped = 0;
jump_boost = 6;
range_pulo = 6;
#endregion

#region dano
vida = 2;
//a quantidade d pixels que o player tem que estar do chão para ignorar o obstaculo
f_dano = function()
{
	var _colisao1 = instance_place(x, ystart, obj_obstaculo1);
	var _colisao2 = instance_place(x, ystart, obj_obstaculo2);
	var _colisao3 = instance_place(x, ystart, obj_vida);
	
	if (_colisao1 and y > ystart-range_pulo)
	{
		instance_destroy(_colisao1);
		vida--;
	}
	if (_colisao2)
	{
		instance_destroy(_colisao2);
		vida--;
	}
	if (_colisao3)
	{
		instance_destroy(_colisao3);
		vida++;
	}
	
	if (!vida) game_restart();
}
#endregion

#region pulo
f_up = function()
{
	if (y >= ystart-range_pulo)
	{
		var _up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
		if (mouse_check_button(mb_left))
		{
			_up = mouse_y < posicao_mouse_y-mouse_margem/2;
		}
		posicao_mouse_y = mouse_y;
	
		if (_up)
		{
			hsped = jump_boost;
			y = ystart-1;
		}
	}
}

f_pulo = function()
{
	//se o player deslizar pra cima ou apertar W ou ^ o hsped é igual jump_boost
	f_up();
	//faz o player cair
	if (hsped > -3) hsped = lerp(hsped, -jump_boost, .03);
	//se o player estive no nível do chão ele para
	if (y > ystart) y = ystart;
	if (y == ystart) hsped = 0;
	y -= hsped;
}
#endregion