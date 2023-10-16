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
	draw_sprite(spr_monstro4, 0, 150, 150);
	draw_text(200, 110, "Runner:\ncorre para o fim da fase\nignorando torres")
	draw_text(200, 170, "300");
	draw_sprite(spr_monstro5, 0, 150, 250);
	draw_text(200, 210, "Arqueiro:\natira flechas nas torres\nduma distancia mais segura");
	draw_text(200, 270, "500");
}

#region visual
#region monstros
f_monstro1 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 150-32, room_width/2+80*i+32, 150+32);
		draw_sprite_ext(spr_monstro1, i+1, room_width/2+80*i, 150, 1+col*.3, 1+col*.2, 0, c_white, 1);
	}
}

f_monstro2 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 250-32, room_width/2+80*i+32, 250+32);
		draw_sprite_ext(spr_monstro2, i+1, room_width/2+80*i, 250, 1+col*.3, 1+col*.2, 0, c_white, 1);
	}
}

f_monstro3 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 350-32, room_width/2+80*i+32, 350+32);
		draw_sprite_ext(spr_monstro3, i+1, room_width/2+80*i, 350, 1+col*.3, 1+col*.2, 0, c_white, 1);
	}
}

f_monstro4 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 450-32, room_width/2+80*i+32, 450+32);
		draw_sprite_ext(spr_monstro4, i+1, room_width/2+80*i, 450, 1+col*.3, 1+col*.2, 0, c_white, 1);
	}
}

f_monstro5 = function()
{
	for (var i = -1; i <= 1; i++)
	{
		var col = point_in_rectangle(mouse_x, mouse_y, room_width/2+80*i-32, 550-32, room_width/2+80*i+32, 550+32);
		draw_sprite_ext(spr_monstro5, i+1, room_width/2+80*i, 550, 1+col*.3, 1+col*.2, 0, c_white, 1);
	}
}
#endregion

f_visual = function()
{
	f_monstro1();
	
	f_monstro2();
	
	f_monstro3();
	
	f_monstro4();
	
	f_monstro5();
}
#endregion