if live_call() return live_result;
if mouse_check_button_pressed(mb_left) and !menu
{
	if object[1] != -1
	{
		var ins = instanciate_on_base(mouse_x,mouse_y,object[0]);
		ins.i = array_length(global.base) - 1;
		array_delete(global.furniture,object[1],1);
		object[1] = -1;
	}
}