nomes = ["Juca", "Joao", "Maria", "Jossoares", "Viniccius13", "Jubscresvauda", "Paulinha"];
idades = ["15", "72", "pi", "178", "28", "45", "-10"];
genero = ["m", "m", "f", "m", "m", "f", "f"];

f_clientes = function()
{
	for (var i = 0; i < 7; i++;)
	{
		draw_sprite(spr_cliente, 0, room_width/2-240, 100+75*i);
		draw_text(room_width/2-200, 60+75*i, "nome: " + nomes[i]);
		draw_text(room_width/2-200, 75+75*i, "idade: " + idades[i]);
		draw_text(room_width/2-200, 90+75*i, "xp: " + string(global.c_xp[i]));
		draw_text(room_width/2-200, 105+75*i, "dinheiro gasto: " + string(global.c_dinheiro[i]));
	}
}