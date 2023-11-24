if (collision_point(mouse_x, mouse_y, self, false, false) and mouse_check_button_pressed(mb_left))
{
	limpando = true;
}

if (limpando)
{
	timer--;
	if (timer == 0) instance_destroy();
}