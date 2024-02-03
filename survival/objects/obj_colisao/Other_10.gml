image_blend = c_white;
var _col1 = collision_point(x-sprite_width, y, obj_colisao, false, false);
var _col2 = collision_point(x+sprite_width, y, obj_colisao, false, false);
var _col3 = collision_point(x, y-sprite_height, obj_colisao, false, false);
var _col4 = collision_point(x, y+sprite_height, obj_colisao, false, false);
if (_col1 and _col2 and _col3 and _col4) image_blend = c_black;