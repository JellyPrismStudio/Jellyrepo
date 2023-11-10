if (collision_point(mouse_x, mouse_y, self, false, false) and mouse_check_button_pressed(mb_right) and image_blend != c_red and !place_meeting(x, y, obj_mobilia))
{
	seguindo = !seguindo;
}

image_blend = c_white;
if (seguindo)
{
	x = round(mouse_x/grid)*grid;
	y = round(mouse_y/grid)*grid;
	
	if (!place_meeting(x, y, obj_colisao) and !place_meeting(x, y, obj_mobilia) and !place_meeting(x, y, obj_saida)) image_blend = c_lime;
	else image_blend = c_red;
}