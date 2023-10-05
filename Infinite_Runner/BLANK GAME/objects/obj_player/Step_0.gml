#region moviento
f_controle = function()
{
	#region teclado
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	//para que lado o player vai mudar
	var _mudar = _right-_left;
	#endregion
	
	#region mouse/toque
	if (device_mouse_check_button_pressed(0, mb_left)) mouse_pos_x = device_mouse_x(0);
	if (device_mouse_check_button_released(0, mb_left))
	{
		var _mudar = abs(device_mouse_x(0)-mouse_pos_x) > mouse_margem? sign(device_mouse_x(0)-mouse_pos_x) : false;
	}
	
	return _mudar
	#endregion
	
	
}

f_movimento = function()
{
	if (!instance_exists(obj_gameover)) posicao += f_controle();
	posicao = clamp(posicao, -1, 1);
	
	//qual posição o player tem que parar
	var _posicao_parar = room_width/2 + posicao*room_width/3;		
	x = lerp(x, _posicao_parar, .3);
	
	//diz se o player está se movendo
	movendo = x == clamp(x, _posicao_parar-10, _posicao_parar+10)? false : true;		
}
#endregion

main = function()
{
	f_movimento();
	f_pulo();
	f_dano();
	f_moeda();
}

main();