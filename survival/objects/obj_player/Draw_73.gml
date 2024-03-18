depth = -y+camera_get_view_y(view_camera[0]);

draw_self();

draw_text(x, y-sprite_height*1.3, fps);

var _dir = point_direction(x, y, mouse_x, mouse_y);
var _dis = point_distance(x, y, mouse_x, mouse_y);
var _moux = x+lengthdir_x(clamp(_dis, 0, size*3.5), _dir);
var _mouy = y+lengthdir_y(clamp(_dis, 0, size*3.5), _dir);
var _x = floor((_moux)/size)*size+size/2;
var _y = floor((_mouy)/size)*size+size/2;
var _submit = collision_rectangle(_x-size/2+2, _y-size/2+2, _x+size/2-2, _y+size/2-2, obj_colisao, false, false);
_submit = _submit == noone? 0 : 1;
var _sprite = _submit? spr_destroy2 : spr_destroy;
draw_sprite(_sprite, _submit, _x, _y);