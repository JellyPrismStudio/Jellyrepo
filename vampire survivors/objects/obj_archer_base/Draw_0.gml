draw_self();
draw_set_halign(fa_center);
draw_text(x, y, "inimigo");
draw_text(x, y-40, string(vida));
draw_set_halign(-1);
draw_path(caminho, x, y, true);