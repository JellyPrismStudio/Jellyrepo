var _bitmask = [0,0,0,0,0,0,0,0];
var validation = [0,0,0,0];
var _object = obj_colisao
var _objsize = sprite_width;

if place_meeting(x,				y - _objsize,	_object)		_bitmask[1] = 1;
if place_meeting(x - _objsize,	y,				_object)		_bitmask[3] = 1;
if place_meeting(x + _objsize,	y,				_object)		_bitmask[4] = 1;
if place_meeting(x,				y + _objsize,	_object)		_bitmask[6] = 1;

if place_meeting(x - _objsize,	y - _objsize,	_object)	and _bitmask[1] == 1 and _bitmask[3] == 1	_bitmask[0] = 1;
if place_meeting(x + _objsize,	y - _objsize,	_object)	and _bitmask[1] == 1 and _bitmask[4] == 1	_bitmask[2] = 1;
if place_meeting(x - _objsize,	y + _objsize,	_object)	and _bitmask[3] == 1 and _bitmask[6] == 1	_bitmask[5] = 1;
if place_meeting(x + _objsize,	y + _objsize,	_object)	and _bitmask[4] == 1 and _bitmask[6] == 1	_bitmask[7] = 1;


////	0	1	2
////	3		4
////	5	6	7

bitmask = _bitmask[0] * 1 + _bitmask[1] * 2 + _bitmask[2] * 4 + _bitmask[3] * 8 + _bitmask[4] * 16 + _bitmask[5] * 32 + _bitmask[6] * 64 + _bitmask[7] * 128
// Variável para armazenar o frame
var _frame = -1;

// Switch com os valores fornecidos
switch (bitmask) {
    case 2:     _frame = 1;     break;
    case 8:     _frame = 2;     break;
    case 10:    _frame = 3;     break;
    case 11:    _frame = 4;     break;
    case 16:    _frame = 5;     break;
    case 18:    _frame = 6;     break;
    case 22:    _frame = 7;     break;
    case 24:    _frame = 8;     break;
    case 26:    _frame = 9;     break;
    case 27:    _frame = 10;    break;
    case 30:    _frame = 11;    break;
    case 31:    _frame = 12;    break;
    case 64:    _frame = 13;    break;
    case 66:    _frame = 14;    break;
    case 72:    _frame = 15;    break;
    case 74:    _frame = 16;    break;
    case 75:    _frame = 17;    break;
    case 80:    _frame = 18;    break;
    case 82:    _frame = 19;    break;
    case 86:    _frame = 20;    break;
    case 88:    _frame = 21;    break;
    case 90:    _frame = 22;    break;
    case 91:    _frame = 23;    break;
    case 94:    _frame = 24;    break;
    case 95:    _frame = 25;    break;
    case 104:   _frame = 26;    break;
    case 106:   _frame = 27;    break;
    case 107:   _frame = 28;    break;
    case 120:   _frame = 29;    break;
    case 122:   _frame = 30;    break;
    case 123:   _frame = 31;    break;
    case 126:   _frame = 32;    break;
    case 127:   _frame = 33;    break;
    case 208:   _frame = 34;    break;
    case 210:   _frame = 35;    break;
    case 214:   _frame = 36;    break;
    case 216:   _frame = 37;    break;
    case 218:   _frame = 38;    break;
    case 219:   _frame = 39;    break;
    case 222:   _frame = 40;    break;
    case 223:   _frame = 41;    break;
    case 248:   _frame = 42;    break;
    case 250:   _frame = 43;    break;
    case 251:   _frame = 44;    break;
    case 254:   _frame = 45;    break;
    case 255:   _frame = 46;    break;
    case 0:     _frame = 0;    break;
    default:    _frame = 0;    break;
}

image_index = _frame;

/*


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

