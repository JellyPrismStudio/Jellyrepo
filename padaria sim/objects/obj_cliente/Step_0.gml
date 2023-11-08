f_state_machine();

if (xp == level[lvl]) lvl++;

if (collision_point(mouse_x, mouse_y, self, false, false) and mouse_check_button_pressed(mb_left))
{
	var _obj = instance_create_depth(0, 0, 0, obj_painel);
	_obj.obj = self;
}