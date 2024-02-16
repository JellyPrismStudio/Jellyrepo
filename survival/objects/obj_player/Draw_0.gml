depth = -y;

draw_self();

draw_set_halign(fa_center);
draw_text(x, y-sprite_height*1.5, state);
draw_set_halign(-1);

draw_line(x, y, x+vlh*vl, y+vlv*vl);

draw_set_color(c_blue);
draw_circle(x, y, raio, true);
var _dir = point_direction(x, y, mouse_x, mouse_y);
draw_line(x, y, x+lengthdir_x(raio, _dir), y+lengthdir_y(raio, _dir));
draw_set_color(c_white);