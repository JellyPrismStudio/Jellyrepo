f_quadrado = function()
{
	draw_set_alpha(.9);
	draw_set_color(c_black);
	draw_rectangle(30, 130, room_width-30, room_height-130, false);
	draw_set_color(c_white);
	draw_rectangle(30, 130, room_width-30, room_height-130, true);
	draw_set_alpha(1);
}

f_botao = function()
{
	var _color = c_white;
	if (mouse_x == clamp(mouse_x, room_width-70, room_width-10) and mouse_y == clamp(mouse_y, room_height-150, room_height-90))
	{
		window_set_cursor(cr_drag);
		_color = c_gray;
		
		if (mouse_check_button_released(mb_left)) room_restart();
	}
	else window_set_cursor(cr_default);
	
	draw_sprite_ext(spr_reset, 0, room_width-40, room_height-130, 1, 1, 0, _color, 1);
}

f_ui = function()
{
	f_quadrado();
	f_botao();
	
	draw_text(40, 140, "time: " + string(obj_gui.timer) + "\ncollected coins: " + string(obj_player.pontuacao) + "\nbest time: " + string(global.timer) + "\nbest collected coins:" + string(global.moedas) + "\npoints: " + string(global.pontos))
}