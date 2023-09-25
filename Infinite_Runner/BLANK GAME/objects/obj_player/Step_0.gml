#region moviento
controle = function()
{
	#region teclado
	var _right = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	var _left = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	var _mudar = _right-_left;		//para que lado o player vai mudar
	#endregion
	
	#region mouse/toque
	if (mouse_check_button(mb_left) and !movendo)		//se o botão esquerdo estiver precionado e o player não estiver se movendo:
	{
		if (mouse_x != clamp(mouse_x, posicao_mouse-5, posicao_mouse+5)) //se a posição atual do mouse ter a diferença d 10 pixels do frame anterior
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
	var _posicao_parar = room_width/2+posicao*room_width/3;		//qual posição o player tem que parar
	x = lerp(x, _posicao_parar, .3);
	
	movendo = x == clamp(x, _posicao_parar-5, _posicao_parar+5)? false : true;		//diz se o player está se movendo
}
#endregion

main = function()
{
	movimento();
}

main();