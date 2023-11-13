f_cliente = function()
{
	draw_sprite_ext(obj.sprite_index, 0, room_width/2-200, room_height/2, 2.5, 2.5, 0, c_white, 1);
	draw_text(room_width/2-80, 80, "level: " + string(obj.lvl));
	draw_text(room_width/2-80, 100, "xp: " + string(obj.xp));
	draw_text(room_width/2-80, 120, "nome: " + obj.nomes[obj.cliente]);
	draw_text(room_width/2-80, 140, "idade: " + obj.idades[obj.cliente]);
	draw_text(room_width/2-80, 160, "genero: " + obj.genero[obj.cliente]);
	draw_text(room_width/2-80, 180, "dinheiro: " + string(obj.dinheiro));
	draw_text(room_width/2-80, 200, "dinheiro inicial: " + string(obj.start_money));
	draw_text(room_width/2-80, 220, "produto favorito: " + obj.favorito[obj.cliente]);
	if (obj.inventario[0, 0] != "")
	{
		for (var i = 0; i < array_length(obj.inventario); i++;)
		{
			draw_sprite_ext(spr_comidas, obj.inventario[i, 1], room_width/2-30+100*i, 300, 5, 5, 0, c_white, 1);
		}
	}
}