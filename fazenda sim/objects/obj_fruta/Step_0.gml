if (place_meeting(x, y, obj_player))
{
	obj_player.dinheiro += image_index+1;
	instance_destroy();
}