draw_set_color(c_aqua);
draw_set_alpha(1-raio1/40);
draw_circle(x, y, raio1*3, false);

draw_set_alpha(1-raio2/40);
draw_circle(x, y, raio2*3, false);

draw_set_alpha(1-raio3/40);
draw_circle(x, y, raio3*3, false);

draw_set_alpha(1-raio4/35);
draw_circle(x, y, raio4*3, false);





draw_set_color(c_blue);
draw_set_alpha((1-raio1/40)-.01);
draw_circle(x, y, raio1*3, true);

draw_set_alpha((1-raio2/40)-.01);
draw_circle(x, y, raio2*3, true);

draw_set_alpha((1-raio3/40)-.01);
draw_circle(x, y, raio3*3, true);

draw_set_alpha((1-raio4/35)-.01);
draw_circle(x, y, raio4*3, true);
draw_set_alpha(1);
draw_set_color(c_white);