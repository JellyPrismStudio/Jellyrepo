var _col1 = collision_point(x-sprite_width, y, obj_colisao, false, false);
var _col2 = collision_point(x+sprite_width, y, obj_colisao, false, false);
var _col3 = collision_point(x, y-sprite_height/2, obj_colisao, false, false);
var _col4 = collision_point(x, y+sprite_height/2, obj_colisao, false, false);

_col1 = _col1? 1 : 0;
_col2 = _col2? 2 : 0;
_col3 = _col3? 4 : 0;
_col4 = _col4? 8 : 0;
image_index = _col1+_col2+_col3+_col4;