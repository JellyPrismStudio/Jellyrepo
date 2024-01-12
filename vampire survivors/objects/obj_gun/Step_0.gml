if (timer > 0) timer--;

if (mouse_check_button(mb_left) and timer == 0)
{
	
	timer = timer_max;
	var _obj = instance_create_depth(x, y, depth, obj_player_bullet);
	_obj.image_angle = image_angle;
}