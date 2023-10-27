if (position_meeting(mouse_x, mouse_y, self) and mouse_check_button_pressed(mb_left))
{
	var _obj = instance_create_depth(0, 0, 0, obj_produtos);
	_obj.obj = self;
}