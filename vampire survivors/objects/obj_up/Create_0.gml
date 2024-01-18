randomize();

lista[0] = ["coracao", "sangramento", "orb", "recarga", "vampirismo", "velocidade", "drone", "ricochete", "tiro multiplo"];
lista[1] = ["aumenta a vida e vida\nmaxima em 20", "inimigos sangram ate\nmorrer", "cria orbs ao redor do\nplayer que causam dano",
"diminui o tempo de\nrecarga", "rouba vida dos inimigos\npara se curar", "aumenta a velocidade do\nplayer",
"cria um drone que ajuda\no player atirando nos\ninimigos", "da uma chance do tiro\nrecochetear, acertando\n2 inimigos",
"faz o player soltar mais\num tiro por vez"];

lista[2, 0] = function()
{
	obj_player.vida += 20;
	obj_player.vida_max += 20;
}
lista[2, 1] = function()
{
	global.sangrando = true;
	global.timer_sangrando -= 20;
}
lista[2, 2] = function() {instance_create_depth(0, 0, depth, obj_orb);};
lista[2, 3] = function() {obj_gun.timer_max -= 10;};
lista[2, 4] = function() {global.vampirismo = true;};
lista[2, 5] = function() {obj_player.sped += 1;};
lista[2, 6] = function() {instance_create_depth(x, y, depth, obj_drone)};
lista[2, 7] = function(){global.ricochete += 5};
lista[2, 8] = function() {obj_gun.tiros++;};

itens[0] = lista[0, irandom(array_length(lista[0])-1)];
itens[1] = lista[0, irandom(array_length(lista[0])-1)];
itens[2] = lista[0, irandom(array_length(lista[0])-1)];
while (itens[1] == itens[0])
{
	itens[1] = lista[0, irandom(array_length(lista[0])-1)];
}
while (itens[2] == itens[0] or itens[2] == itens[1])
{
	itens[2] = lista[0, irandom(array_length(lista[0])-1)];
}

f_fundo = function()
{
	draw_set_color(c_maroon);
	draw_rectangle(view_wport[0]/4, view_hport[0]/3.5, view_wport[0]/1.25, view_hport[0]/1.28, false);
	draw_set_color(c_ltgray);
	draw_rectangle(view_wport[0]/4, view_hport[0]/3.5, view_wport[0]/1.25, view_hport[0]/1.28, true);
	draw_rectangle(view_wport[0]/4+1, view_hport[0]/3.5+1, view_wport[0]/1.25-1, view_hport[0]/1.28-1, true);
	draw_rectangle(view_wport[0]/4+2, view_hport[0]/3.5+2, view_wport[0]/1.25-2, view_hport[0]/1.28-2, true);
	draw_set_color(c_white);	
}

f_botoes = function()
{
	for (var i = 0; i < 3; i++;)
	{
		var _dis = 10;
		var _color = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis,
		view_hport[0]/3.5+_dis, view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis)? c_white : c_gray;
		
		draw_set_color(_color);
		draw_rectangle(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis, view_hport[0]/3.5+_dis,
		view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis, true);
		
		_dis = 11;
		draw_rectangle(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis, view_hport[0]/3.5+_dis,
		view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis, true);
		draw_set_color(c_white);
		
		draw_sprite_ext(spr_boosters, array_get_index(lista[0], itens[i]), view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+.5), view_hport[0]/2.3, 10, 10, 0, c_white, 1);
		draw_text(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis*2, view_hport[0]/1.7, lista[0, array_get_index(lista[0], itens[i])]);
		draw_text(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis*2, view_hport[0]/1.7+_dis*2, lista[1, array_get_index(lista[0], itens[i])]);
		
		if (_color == c_white and mouse_check_button_pressed(mb_left))
		{
			instance_destroy();
			lista[2, array_get_index(lista[0], itens[i])]();
		}
	}
}