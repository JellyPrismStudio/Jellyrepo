#region moviento
controle = function()
{
	#region teclado
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _mudar = _right-_left;		//para que lado o player vai mudar
	#endregion
	
	#region mouse/toque
	// se o botão esquerdo estiver precionado e o player não estiver se movendo:
	if (mouse_check_button(mb_left) and !movendo)		
	{
		// se a posição atual do mouse ter a diferença d 10 pixels do frame anterior
		if (mouse_x != clamp(mouse_x, posicao_mouse-(mouse_margem/2), posicao_mouse+(mouse_margem/2))) 
		var _mudar = mouse_x > posicao_mouse? _mudar+1 : _mudar-1;
	}
	posicao_mouse = mouse_x;
	
	return _mudar
	#endregion
	
	
}

movimento = function()
{
	posicao += controle();
	posicao = clamp(posicao, -1, 1);
	
	//qual posição o player tem que parar
	var _posicao_parar = room_width/2 + posicao*room_width/3;		
	x = lerp(x, _posicao_parar, .3);
	
	//diz se o player está se movendo
	movendo = x == clamp(x, _posicao_parar-5, _posicao_parar+5)? false : true;		
}
#endregion

main = function()
{
	movimento();
}

main();