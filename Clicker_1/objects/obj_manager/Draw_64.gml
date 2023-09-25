// * Como aqui estamos usando um método especial só para o desenho, não precisa de main
// * Caso seja adicionado muito conteudo novo, será necessário

if live_call() return live_result;


draw_text(10,10,mouse_zoom);
draw_text(60,10,string(mouse_x) + " : " + string(mouse_y));
draw_text(400,10,string(global.points));
