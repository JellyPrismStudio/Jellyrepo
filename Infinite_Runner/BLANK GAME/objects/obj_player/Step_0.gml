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
	// se o botão esquerdo estiver precionado e o player não estiver se movendo:
	if (mouse_check_button(mb_left) and !movendo)		
	{
		if (mouse_x != clamp(mouse_x, posicao_mouse_x-(mouse_margem/2), posicao_mouse_x+(mouse_margem/2))) 
		var _mudar = mouse_x > posicao_mouse_x? _mudar+1 : _mudar-1;
	}
	posicao_mouse_x = mouse_x;
	
	return _mudar
	#endregion
	
	
}

f_movimento = function()
{
	posicao += f_controle();
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
	f_pulo();
	f_movimento();
	f_dano();
}

main();