draw_self();
draw_set_halign(fa_center);
draw_text(x, y-110, "xp: " + string(xp));
draw_text(x, y-95, "nome: " + nomes[cliente]);
draw_text(x, y-80, "idade: " + idades[cliente]);
draw_text(x, y-65, "genero: " + genero[cliente]);
draw_text(x, y-50, "dinheiro: " + string(dinheiro));
draw_set_halign(-1);