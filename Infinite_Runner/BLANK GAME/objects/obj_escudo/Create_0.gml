#region sprite
f_sprite = function()
{
	image_xscale = .5;
	image_yscale = .5;
}
#endregion

#region colisão com obstaculo
f_place_obstacle = function()
{
	var _colisao = instance_place(x, y, obj_obstaculo2);
	if (_colisao) instance_destroy(_colisao);
	_colisao = instance_place(x, y, obj_obstaculo1);
	if (_colisao) instance_destroy(_colisao);
}
#endregion

#region player
player = false;
f_player = function()
{
	if (place_meeting(x, y, obj_player) and !player)
	{
		timer = 60*15;
		player = true;
	}
	if (player)
	{
		image_xscale = 1;
		image_yscale = 1;
		x = obj_player.x;
		y = obj_player.y;
		
		timer--;
		if (timer == 0) instance_destroy();
		image_alpha = timer/60/15+.2;
	}
}
#endregion