if (timer <= 250) timer++;
if (timer > 0 and timer/10 == floor(timer/10))
{
	if (!surface_exists(surf_dirt)) surf_dirt = surface_create(room_width/10, room_height/10);
	var _x = timer/10-1;
	var _y = 0;
	while (_x >= 5)
	{
		_x -= 5;
		_y++;
	}
	_x *= room_width/10;
	_y *= room_height/10;
	surface_set_target(surf_dirt);
	for (var i = 0; i < room_width/5; i += sprite_get_width(spr_noise)*abs(_xscale);)
	{
		for (var j = 0; j < room_height/5; j += sprite_get_height(spr_noise)*abs(_yscale);)
		{
			draw_sprite_ext(spr_noise, _sprite, i, j, _xscale, _yscale, 0, c_white, 1);
		}
	}
	surface_reset_target();

	spr_dirt = sprite_create_from_surface(surf_dirt, 0, 0, room_width/10, room_height/10, true, false, 0, 0);
	var _obj = instance_create_depth(_x, _y, depth, obj_noise_dirt);
	_obj.sprite_index = spr_dirt;
}

var _x = floor(obj_player.x/16/size)*16*size+16*size/2;
var _y = floor(obj_player.y/16/size)*16*size+16*size/2;

if (chunkx != floor(obj_player.x/size/16) or chunky != floor(obj_player.y/size/16))
{
	for (var i = -1; i <= 1; i++;)
	{
		for (var j = -1; j <= 1; j++;)
		{
			if (!collision_point(_x+size*16*i, _y+size*16*j, obj_chunk, false, false))
			{
				instance_create_depth(_x+size*16*i, _y+size*16*j, -_y+size*16*j, obj_chunk);
			}
		}
	}
	with (obj_chunk)
	{
		if (abs(floor(x/size/16)-floor(obj_player.x/size/16)) > 1 or abs(floor(y/size/16)-floor(obj_player.y/size/16)) > 1)
		{
			instance_destroy();
		}
	}
}

chunkx = floor(obj_player.x/size/16);
chunky = floor(obj_player.y/size/16);