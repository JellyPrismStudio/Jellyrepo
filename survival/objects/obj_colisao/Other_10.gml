var _col1 = place_meeting(x-sprite_width, y, obj_colisao);
var _col2 = place_meeting(x+sprite_width, y, obj_colisao);
var _col3 = place_meeting(x, y-sprite_width, obj_colisao);
var _col4 = place_meeting(x, y+sprite_width, obj_colisao);
var _col5 = place_meeting(x-sprite_width, y-sprite_width, obj_colisao);
var _col6 = place_meeting(x+sprite_width, y-sprite_width, obj_colisao);
var _col7 = place_meeting(x-sprite_width, y+sprite_width, obj_colisao);
var _col8 = place_meeting(x+sprite_width, y+sprite_width, obj_colisao);

_col1 = _col1? 1 : 0;
_col2 = _col2? 2 : 0;
_col3 = _col3? 4 : 0;
_col4 = _col4? 8 : 0;
_col5 = !_col5 and _col1 and _col3? 17 : 0;
_col6 = !_col6 and _col2 and _col3? 25 : 0;
_col7 = !_col7 and _col1 and _col4? 33 : 0;
_col8 = !_col8 and _col2 and _col4? 42 : 0;
image_index = _col1+_col2+_col3+_col4+_col5+_col6+_col7+_col8;