var _col1 = place_meeting(x-sprite_width, y, obj_colisao);
var _col2 = place_meeting(x+sprite_width, y, obj_colisao);
var _col3 = place_meeting(x, y-sprite_width, obj_colisao);
var _col4 = place_meeting(x, y+sprite_width, obj_colisao);

_col1 = _col1? 1 : 0;
_col2 = _col2? 2 : 0;
_col3 = _col3? 4 : 0;
_col4 = _col4? 8 : 0;
image_index = _col1+_col2+_col3+_col4;