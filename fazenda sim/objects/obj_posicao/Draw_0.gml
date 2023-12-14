draw_sprite(spr_casa, 0, round(mouse_x/32)*32, round((mouse_y+32)/32)*32);
if (mouse_check_button_pressed(mb_left))
{
	instance_create_depth(round(mouse_x/32)*32, round((mouse_y+32)/32)*32, 0, obj_casa);
	instance_destroy();
}