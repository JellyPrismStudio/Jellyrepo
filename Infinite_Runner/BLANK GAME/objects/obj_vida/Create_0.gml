#region sprite
f_sprite = function()
{
	image_xscale = 2;
	image_yscale = 2;
	image_speed = 0;
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