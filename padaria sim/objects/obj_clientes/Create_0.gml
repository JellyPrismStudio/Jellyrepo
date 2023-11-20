scr_destruir("clientes");

pagina = 0;
pagina_max = 2;

nomes = ["Juca", "Joao", "Maria", "Jossoares", "Viniccius13", "Jubscresvauda", "Paulinha", "James da salada de fruta", "zézinho", "Ana Maria Braga", "Silvio Santos"];
favorito = ["pão", "presunto", "torta", "pastel", "pão de forma", "bolo", "queijo", "torta", "pastel", "bolo", "pão"];
idades = ["15", "72", "pi", "178", "28", "45", "-10", "43", "25", "39", "\∞"];
genero = ["m", "m", "f", "m", "m", "f", "f", "m", "f", "f", "m"];

f_clientes = function()
{
	for (var i = 7*pagina; i < clamp(array_length(nomes), pagina*7, (pagina+1)*7); i++;)
	{
		draw_sprite(spr_cliente, 0, room_width/2-240, 100+75*(i-floor(i/7)*7));
		draw_line(room_width/2-300, 60+75*(i-floor(i/7)*7), room_width/2+300, 60+75*(i-floor(i/7)*7));
		draw_text(room_width/2-200, 55+75*(i-floor(i/7)*7), "nome: " + nomes[i]);
		draw_text(room_width/2-200, 70+75*(i-floor(i/7)*7), "idade: " + idades[i]);
		draw_text(room_width/2-200, 85+75*(i-floor(i/7)*7), "xp: " + string(global.c_xp[i]));
		draw_text(room_width/2-200, 100+75*(i-floor(i/7)*7), "dinheiro gasto: " + string(global.c_dinheiro[i]));
		draw_text(room_width/2-200, 115+75*(i-floor(i/7)*7), "produto preferido: " + favorito[i]);
	}
}