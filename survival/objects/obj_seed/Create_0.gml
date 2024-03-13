randomize();
depth = -room_height;

obj_player.x = room_width/2;
obj_player.y = room_width/2;
size = 48;
for (var i = 0; i <= room_width/size/16+2; i++;)
{
	for (var j = 0; j <= room_width/size/16+2; j++;)
	{
		global.chunks[i, j] = noone;
	}
}

var _dirt = choose("a", "b", "c")+string(irandom_range(0, 9))+string(irandom_range(0, 9));
var _sand = choose("a", "b", "c")+string(irandom_range(0, 9))+string(irandom_range(0, 9));
global.seed = _dirt+_sand;
global.spr_dirt = noone;
show_debug_message(global.seed)

_sprite = string_copy(global.seed, 0, 1);
_sprite = _sprite == "a"? 0 : _sprite;
_sprite = _sprite == "b"? 1 : _sprite;
_sprite = _sprite == "c"? 2 : _sprite;
_xscale = string_copy(global.seed, 2, 1);
switch (_xscale)
{
	case "0":
		_xscale = 1;
	break;
	case "1":
		_xscale = 1.5;
	break;
	case "2":
		_xscale = 2;
	break;
	case "3":
		_xscale = 2.5;
	break;
	case "4":
		_xscale = 3;
	break;
	case "5":
		_xscale = -1;
	break;
	case "6":
		_xscale = -1.5;
	break;
	case "7":
		_xscale = -2;
	break;
	case "8":
		_xscale = -2.5;
	break;
	case "9":
		_xscale = -3;
	break;
}
_yscale = string_copy(global.seed, 3, 1);
switch (_yscale)
{
	case "1":
		_yscale = 1;
	break;
	case "2":
		_yscale = 1.5;
	break;
	case "3":
		_yscale = 2;
	break;
	case "4":
		_yscale = 2.5;
	break;
	case "5":
		_yscale = 3;
	break;
	case "6":
		_yscale = -1;
	break;
	case "7":
		_yscale = -1.5;
	break;
	case "8":
		_yscale = -2;
	break;
	case "9":
		_yscale = -2.5;
	break;
	case "10":
		_yscale = -3;
	break;
}

var _adx = _xscale < 0? sprite_get_width(spr_noise2)*abs(_xscale) : 0;
var _ady = _yscale < 0? sprite_get_height(spr_noise2)*abs(_yscale) : 0;
for (var i = _adx; i < room_width+sprite_get_width(spr_noise2)*abs(_xscale); i += sprite_get_width(spr_noise2)*abs(_xscale);)
{
	for (var j = _ady; j < room_height+sprite_get_height(spr_noise2)*abs(_yscale); j += sprite_get_height(spr_noise2)*abs(_yscale);)
	{
		var _obj = instance_create_depth(i, j, 0, obj_noise_dirt);
		_obj.image_index = _sprite;
		_obj.image_xscale = _xscale;
		_obj.image_yscale = _yscale;
	}
}

timer_day_max = 3600;
timer_day = timer_day_max/2;
day = true;
alpha_max = .9;
alpha = 0;

chunkx = -floor(obj_player.x/size/16);
chunky = -floor(obj_player.y/size/16);