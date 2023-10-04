f_moeda = function ()
{
	draw_sprite_ext(spr_moeda, 0, 30, 30, 2, 2, 0, c_white, 1);
	plus_text_font(50, 30, ": " + string(global.pontos), c_white, fnt_DayDream, fa_left, fa_middle);
}

f_itens = function()
{
	draw_sprite_ext(spr_ima, 0, 130, 30, 1, 1, -90, c_white, 1);
	plus_text_font(150, 30, ": " + string(global.ima), c_white, fnt_DayDream, fa_left, fa_middle);
	draw_sprite_ext(spr_escudo, 0, 198, 30, .4, .4, 0, c_white, 1);
	plus_text_font(220, 30, ": " + string(global.shield), c_white, fnt_DayDream, fa_left, fa_middle);
	draw_sprite_ext(spr_estrela, 0, 265, 30, 1.2, 1.2, 0, c_white, 1);
	plus_text_font(285, 30, ": " + string(global.star), c_white, fnt_DayDream, fa_left, fa_middle);
}

f_star = function()
{
	var _color = c_white;
	if (mouse_x == clamp(mouse_x, 0, 220) and mouse_y == clamp(mouse_y, 320, 440))
	{
		_color = c_gray;
		
		if (mouse_check_button_released(mb_left) and global.pontos >= 50)
		{
			global.star++;
			global.pontos -= 50;
			ini_open("stats.ini");
			ini_write_real("stats", "estrela", global.star);
			ini_close();
		}
	}
	
	draw_sprite_ext(spr_estrela, 0, 70, 380, 3, 3, 0, _color, 1);
	draw_sprite_ext(spr_moeda, 0, 150, 380, 1, 1, 0, _color, 1);
	draw_set_color(_color);
	draw_text(160, 370, ": 50");
	draw_set_color(c_white);
}
//star + shield = starfield?
f_shield = function()
{
	var _color = c_white;
	if (mouse_x == clamp(mouse_x, 0, 220) and mouse_y == clamp(mouse_y, 190, 310))
	{
		_color = c_gray;
		
		if (mouse_check_button_released(mb_left) and global.pontos >= 30)
		{
			global.shield++;
			global.pontos -= 30;
			ini_open("stats.ini");
			ini_write_real("stats", "escudo", global.shield);
			ini_close();
		}
	}
	
	draw_sprite_ext(spr_escudo, 0, 70, 250, 1, 1, 0, _color, 1);
	draw_sprite_ext(spr_moeda, 0, 150, 250, 1, 1, 0, _color, 1);
	draw_set_color(_color);
	draw_text(160, 240, ": 30");
	draw_set_color(c_white);
}

f_ima = function()
{
	var _color = c_white;
	if (mouse_x == clamp(mouse_x, 0, 220) and mouse_y == clamp(mouse_y, 60, 180))
	{
		_color = c_gray;
		
		if (mouse_check_button_released(mb_left) and global.pontos >= 20)
		{
			global.ima++;
			global.pontos -= 20;
			ini_open("stats.ini");
			ini_write_real("stats", "imã", global.ima);
			ini_close();
		}
	}
	
	draw_sprite_ext(spr_ima, 0, 70, 120, 2.5, 2.5, -90, _color, 1);
	draw_sprite_ext(spr_moeda, 0, 150, 120, 1, 1, 0, _color, 1);
	draw_set_color(_color);
	draw_text(160, 110, ": 20");
	draw_set_color(c_white);
}

f_botao = function()
{
	var _color = c_white;
	if (mouse_x == clamp(mouse_x, room_width-70, room_width-10) and mouse_y == clamp(mouse_y, room_height-70, room_height-10))
	{
		_color = c_gray;
		
		if (mouse_check_button_released(mb_left)) room_goto(scn_jogo);
	}
	
	draw_sprite_ext(spr_play, 0, room_width-40, room_height-40, 1, 1, 0, _color, 1);
}