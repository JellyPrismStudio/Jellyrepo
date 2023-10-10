gold = 100;
wave = ds_list_create();
game = 0;
timer = 30;
monstro = 0;

f_botao = function()
{
	var _color = c_lime;
	if (mouse_x == clamp(mouse_x, room_width/2-200, room_width/2+200) and mouse_y == clamp(mouse_y, room_height/1.35-40, room_height/1.35)) _color = c_green;
	if (ds_list_size(wave) == 0) _color = c_maroon;
	draw_set_color(_color);
	draw_rectangle(room_width/2-200, room_height/1.35, room_width/2+200, room_height/1.35-40, false);
	draw_set_color(c_black);
	draw_rectangle(room_width/2-200, room_height/1.35, room_width/2+200, room_height/1.35-40, true);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	draw_text(room_width/2, room_height/1.35-20, "iniciar onda")
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_color(c_white)
	
	if (_color == c_green and mouse_check_button_pressed(mb_left)) game = 1;
}

f_monstros = function()
{
	draw_set_alpha(.6);
	draw_rectangle(room_width/3, room_height/8, room_width/1.5, room_height/1.3, false);
	draw_rectangle(room_width/2-180, room_height-8, room_width/2+180, room_height-135, false);
	draw_set_alpha(.9);
	draw_sprite_ext(spr_monstro1, 0, room_width/2-110, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_sprite_ext(spr_monstro2, 0, room_width/2, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_sprite_ext(spr_monstro3, 0, room_width/2+110, room_height-70, 1.5, 1.5, 0, c_white, 1);
	draw_set_color(c_yellow);
	draw_text(10, 10, string(gold))
	draw_set_halign(fa_center);
	draw_text(room_width/2-110, room_height-25, ": 50");
	draw_text(room_width/2, room_height-25, ": 100");
	draw_text(room_width/2+110, room_height-25, ": 150");
	draw_set_halign(-1);
	draw_set_color(c_white)
	draw_set_alpha(1);
	
	f_botao();
}

f_criatura = function(_obj)
{
	if (instance_exists(obj_criacao))
	{
		instance_create_layer(obj_criacao.x, obj_criacao.y, layer, _obj);
	}
}

f_mouse = function()
{
	if (mouse_check_button_released(mb_left) and mouse_y == clamp(mouse_y, room_height-70-48, room_height-70+48))
	{
		var _obj = noone;
		if (mouse_x == clamp(mouse_x, room_width/2-110-48, room_width/2-110+48))
		{
			if (gold >= 50)
			{
				ds_list_add(wave, obj_monstro1)
				gold -= 50;
			}
		}
		if (mouse_x == clamp(mouse_x, room_width/2-48, room_width/2+48))
		{
			if (gold >= 100)
			{
				ds_list_add(wave, obj_monstro2)
				gold -= 100;
			}
		}
		if (mouse_x == clamp(mouse_x, room_width/2+110-48, room_width/2+110+48))
		{
			if (gold >= 150)
			{
				ds_list_add(wave, obj_monstro3)
				gold -= 150;
			}
		}
		
		if (_obj != noone) f_criatura(_obj);
	}
}

f_onda = function()
{
	for (var i = 0; i < ds_list_size(wave); i++;)
	{
		draw_sprite(object_get_sprite(ds_list_find_value(wave, i)), 0, room_width/3+40+70*(i-floor(i/6)*6), room_height/8+40+floor(i/6)*70)
	}
}

f_ui = function()
{
	if (game == 0)
	{
		f_monstros();
		f_mouse();
		f_onda();
	}
	if (game == 1)
	{
		timer--;
		if (timer == 0)
		{
			instance_create_layer(obj_criacao.x, obj_criacao.y, layer, ds_list_find_value(wave, monstro))
			timer = 30;
			monstro++
		}
		if (monstro >= ds_list_size(wave)) game = 2;
	}
}