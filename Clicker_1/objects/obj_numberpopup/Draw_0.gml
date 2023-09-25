draw_text_color(x+1,y,number, out, out, out, out, image_alpha)
draw_text_color(x-1,y,number, out, out, out, out, image_alpha)
draw_text_color(x,y+1,number, out, out, out, out, image_alpha)
draw_text_color(x,y-1,number, out, out, out, out, image_alpha)
draw_text_color(x,y,number, col, col, col, col, image_alpha)
// * Qualquer variavel fixa que se repita mais de 1x deve ser criada uma separada para alteração
// * fácil posterior. Se possível, agrupar todas elas mais ou menos próximas ou na mesma seção do código

// Destruir quando ficar invisivel
if image_alpha < 0.01 instance_destroy();