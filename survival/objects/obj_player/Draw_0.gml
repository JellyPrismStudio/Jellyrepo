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

draw_text(x, y-sprite_height*1.3, fps);

var _dir = point_direction(x, y, mouse_x, mouse_y);
var _dis = point_distance(x, y, mouse_x, mouse_y);
var _moux = x+lengthdir_x(clamp(_dis, 0, size*3.5), _dir);
var _mouy = y+lengthdir_y(clamp(_dis, 0, size*3.5), _dir);
var _x = floor((_moux)/size)*size+size/2;
var _y = floor((_mouy)/size)*size+size/2;
var _submit = collision_rectangle(_x-size/2+2, _y-size/2+2, _x+size/2-2, _y+size/2-2, obj_colisao, false, false);
_submit = _submit == noone? 0 : 1;
draw_rectangle(_x-size/2+2, _y-size/2+2, _x+size/2-2, _y+size/2-2, true);
draw_sprite(spr_destroy, _submit, _x, _y);