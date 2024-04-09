while (place_meeting(x, y, obj_colisao))
{
	var _col = instance_place(x, y, obj_colisao);
	if (_col != noone) instance_destroy(_col);
}