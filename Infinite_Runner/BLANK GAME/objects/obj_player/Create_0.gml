#region variaveis
posicao = 0;
movendo = true;
mouse_margem = 50;
mouse_pos_x = device_mouse_x(0);
mouse_pos_y = device_mouse_y(0);

hsped = 0;
jump_boost = 6;
range_pulo = 6;
pontuacao = 0;
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
	
	if (!vida)
	{
		layer_vspeed("fundo", 0);
		if (!instance_exists(obj_gameover))
		{
			instance_create_depth(0, 0, 0, obj_gameover);
		
			if (obj_gui.timer > global.timer) global.timer = obj_gui.timer;
			if (pontuacao > global.moedas) global.moedas = pontuacao
			
			global.pontos += pontuacao;
		}
	}
}
#endregion

#region pulo
f_up = function()
{
	if (y >= ystart-range_pulo and !instance_exists(obj_gameover))
	{
	var _up = false
	if (device_mouse_check_button_pressed(0, mb_left)) mouse_pos_y = device_mouse_y(0);
	if (device_mouse_check_button_released(0, mb_left))
	{
		var _up = mouse_pos_y-device_mouse_y(0) > mouse_margem;
	}
	
		if (_up)
		{
			hsped = jump_boost/(layer_get_vspeed("fundo")/5);
			y = ystart-1;
		}
	}
}

f_pulo = function()
{
	//se o player deslizar pra cima ou apertar W ou ^ o hsped é igual jump_boost
	f_up();
	//faz o player cair
	if (hsped > -3) hsped = lerp(hsped, -jump_boost/(layer_get_vspeed("fundo")/5), .03);
	//se o player estive no nível do chão ele para
	if (y > ystart) y = ystart;
	if (y == ystart) hsped = 0;
	if (!instance_exists(obj_gameover)) y -= hsped*layer_get_vspeed("fundo")/5;
}
#endregion

#region moeda
f_moeda = function()
{
	var _moeda = instance_place(x, y, obj_moeda)
	if (_moeda)
	{
		instance_destroy(_moeda);
		pontuacao++;
	}
}
#endregion