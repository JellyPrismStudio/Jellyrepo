f_texto = function()
{
	draw_text(10, 10, string(global.gold));
	draw_set_halign(fa_middle);
	draw_text(200, 50, "monstros:");
	draw_text(room_width/2, 50, "visuais:");
	draw_text(room_width-200, 50, "upgrades:");
	draw_set_halign(-1);
}

f_monstros = function()
{
	var _color = global.monstro4? c_gray : c_white;
	if (mouse_x == clamp(mouse_x, 110, 450) and mouse_y == clamp(mouse_y, 110, 220) and _color == c_white) _color = c_yellow;
	draw_set_color(_color)
	draw_sprite(spr_monstro4, 0, 150, 150);
	draw_text(200, 110, "Runner:\ncorre para o fim da fase\nignorando torres")
	draw_text(200, 170, "800");
	draw_rectangle(100, 100, 480, 200, true);
	if (_color == c_yellow and mouse_check_button(mb_left) and global.gold >= 800)
	{
		global.gold -= 800;
		global.monstro4 = true;
	}
	draw_set_color(c_white);
	
	draw_sprite(spr_monstro5, 0, 150, 250);
	draw_text(200, 210, "Arqueiro:\natira flechas nas torres\nduma distancia mais segura");
	draw_text(200, 270, "1000");
}

#region visual
#region monstros
f_monstro1 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 150-32, room_width/2+80*i+32, 150+32);
		draw_sprite_ext(spr_monstro1, i+1, room_width/2+80*i, 150, 1+col*.2, 1+col*.2, 0, c_white, 1);
		
		if (global.visual1-1 == i)
		{
			draw_set_color(c_yellow);
			draw_rectangle(room_width/2+80*(global.visual1-1)-36-6*col, 150-36-6*col, room_width/2+80*(global.visual1-1)+35+6*col, 150+35+6*col, true);
			draw_set_color(c_white);
		}
		
		var _cadeado = false;
		if (i == 0 and global.visual1_m1 == 0 or i == 1 and global.visual2_m1 == 0)
		{
			_cadeado = true;
			draw_sprite_ext(spr_cadeado, 0, room_width/2+80*i, 155, 2.3, 2.3, 0, c_white, 1);
		}
		if (col and mouse_check_button_pressed(mb_left))
		{
			if (_cadeado)
			{
				if (global.gold > 100)
				{
					global.gold -= 100;
					if (i == 0) global.visual1_m1 = true;
					if (i == 1) global.visual2_m1 = true;
				}
			}
			else global.visual1 = i+1;
		}
	}
}

f_monstro2 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 250-32, room_width/2+80*i+32, 250+32);
		draw_sprite_ext(spr_monstro2, i+1, room_width/2+80*i, 250, 1+col*.2, 1+col*.2, 0, c_white, 1);
		
		if (global.visual2-1 == i)
		{
			draw_set_color(c_yellow);
			draw_rectangle(room_width/2+80*(global.visual2-1)-36-6*col, 250-36-6*col, room_width/2+80*(global.visual2-1)+35+6*col, 250+35+6*col, true);
			draw_set_color(c_white);
		}
		
		var _cadeado = false;
		if (i == 0 and global.visual1_m2 == 0 or i == 1 and global.visual2_m2 == 0)
		{
			_cadeado = true;
			draw_sprite_ext(spr_cadeado, 0, room_width/2+80*i, 255, 2.3, 2.3, 0, c_white, 1);
		}
		if (col and mouse_check_button_pressed(mb_left))
		{
			if (_cadeado)
			{
				if (global.gold > 100)
				{
					global.gold -= 100;
					if (i == 0) global.visual1_m2 = true;
					if (i == 1) global.visual2_m2 = true;
				}
			}
			else global.visual1 = i+1;
		}
	}
}

f_monstro3 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 350-32, room_width/2+80*i+32, 350+32);
		draw_sprite_ext(spr_monstro3, i+1, room_width/2+80*i, 350, 1+col*.2, 1+col*.2, 0, c_white, 1);
		
		if (global.visual1-1 == i)
		{
			draw_set_color(c_yellow);
			draw_rectangle(room_width/2+80*(global.visual3-1)-36-6*col, 350-36-6*col, room_width/2+80*(global.visual3-1)+35+6*col, 350+35+6*col, true);
			draw_set_color(c_white);
		}
		
		var _cadeado = false;
		if (i == 0 and global.visual1_m3 == 0 or i == 1 and global.visual2_m3 == 0)
		{
			_cadeado = true;
			draw_sprite_ext(spr_cadeado, 0, room_width/2+80*i, 355, 2.3, 2.3, 0, c_white, 1);
		}
		if (col and mouse_check_button_pressed(mb_left))
		{
			if (_cadeado)
			{
				if (global.gold > 100)
				{
					global.gold -= 100;
					if (i == 0) global.visual1_m3 = true;
					if (i == 1) global.visual2_m3 = true;
				}
			}
			else global.visual1 = i+1;
		}
	}
}

f_monstro4 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 450-32, room_width/2+80*i+32, 450+32);
		draw_sprite_ext(spr_monstro4, i+1, room_width/2+80*i, 450, 1+col*.2, 1+col*.2, 0, c_white, 1);
		
		if (global.visual4-1 == i)
		{
			draw_set_color(c_yellow);
			draw_rectangle(room_width/2+80*(global.visual4-1)-36-6*col, 450-36-6*col, room_width/2+80*(global.visual4-1)+35+6*col, 450+35+6*col, true);
			draw_set_color(c_white);
		}
		
		var _cadeado = false;
		if (i == 0 and global.visual1_m4 == 0 or i == 1 and global.visual2_m4 == 0)
		{
			_cadeado = true;
			draw_sprite_ext(spr_cadeado, 0, room_width/2+80*i, 455, 2.3, 2.3, 0, c_white, 1);
		}
		if (col and mouse_check_button_pressed(mb_left))
		{
			if (_cadeado)
			{
				if (global.gold > 100)
				{
					global.gold -= 100;
					if (i == 0) global.visual1_m4 = true;
					if (i == 1) global.visual2_m4 = true;
				}
			}
			else global.visual1 = i+1;
		}
	}
}

f_monstro5 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 550-32, room_width/2+80*i+32, 550+32);
		draw_sprite_ext(spr_monstro5, i+1, room_width/2+80*i, 550, 1+col*.2, 1+col*.2, 0, c_white, 1);
		
		if (global.visual5-1 == i)
		{
			draw_set_color(c_yellow);
			draw_rectangle(room_width/2+80*(global.visual5-1)-36-6*col, 550-36-6*col, room_width/2+80*(global.visual5-1)+35+6*col, 550+35+6*col, true);
			draw_set_color(c_white);
		}
		
		var _cadeado = false;
		if (i == 0 and global.visual1_m5 == 0 or i == 1 and global.visual2_m5 == 0)
		{
			_cadeado = true;
			draw_sprite_ext(spr_cadeado, 0, room_width/2+80*i, 555, 2.3, 2.3, 0, c_white, 1);
		}
		if (col and mouse_check_button_pressed(mb_left))
		{
			if (_cadeado)
			{
				if (global.gold > 100)
				{
					global.gold -= 100;
					if (i == 0) global.visual1_m5 = true;
					if (i == 1) global.visual2_m5 = true;
				}
			}
			else global.visual1 = i+1;
		}
	}
}
#endregion
#endregion
f_visual = function()
{
	draw_set_halign(fa_center);
	draw_set_color(c_yellow);
	draw_text(room_width/2, 75, "100");
	draw_set_color(c_white);
	draw_set_halign(-1);
	
	f_monstro1();
	f_monstro2();
	f_monstro3();
	f_monstro4();
	f_monstro5();
}

f_botao = function()
{
	var _color = c_white;
	if (point_in_circle(mouse_x, mouse_y, 1240, 600, 32))
	{
		_color = c_gray;
		if (mouse_check_button_pressed(mb_left))
		{
			room_goto((scn_mapa));
		}
	}
	draw_sprite_ext(spr_back, 0, 1240, 600, 1, 1, 0, _color, 1);
	
	draw_text(10, 10, string(global.gold))
}

f_upgrades = function()
{
	var _color = global.strenght > 0? c_white : c_gray;
	draw_set_halign(fa_middle);
	if (point_in_rectangle(mouse_x, mouse_y, room_width-350, 95, room_width-50, 170))
	{
		_color = c_yellow;
		if (mouse_check_button_pressed(mb_left) and global.gold > 100+global.strenght*50 and global.strenght < 10)
		{
			global.strenght++;
			global.gold -= 100+global.strenght*50;
		}
	}
	draw_set_color(_color);
	draw_rectangle(room_width-350, 95, room_width-50, 170, true);
	var draw = global.strenght < 10? string(100 + global.strenght*50) + " pontos" : "";
	draw_text(room_width-200, 100, "forca:" + string(global.strenght) + "\nmonstros dão mais dano\n" + draw);
	if (global.strenght == 0)
	{
		draw_sprite_ext(spr_cadeado, 0, room_width-200, 140, 2.5, 2.5, 0, c_white, 1);
	}
	
	
	
	var _color = global.sped > 0? c_white : c_gray;
	if (point_in_rectangle(mouse_x, mouse_y, room_width-350, 195, room_width-50, 270))
	{
		_color = c_yellow;
		if (mouse_check_button_pressed(mb_left) and global.gold > 100+global.sped*50 and global.sped < 10)
		{
			global.sped++;
			global.gold -= 100+global.sped*50;
		}
	}
	draw_set_color(_color);
	draw_rectangle(room_width-350, 195, room_width-50, 270, true);
	var draw = global.sped < 10? string(100 + global.sped*50) + " pontos" : "";
	draw_text(room_width-200, 200, "velocidade:" + string(global.sped) + "\nmonstros são mais velozes\n" + draw);
	if (global.sped == 0)
	{
		draw_sprite_ext(spr_cadeado, 0, room_width-200, 240, 2.5, 2.5, 0, c_white, 1);
	}
	draw_set_color(c_white);
	draw_set_halign(-1);
}