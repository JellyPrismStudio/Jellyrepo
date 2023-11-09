function scr_draw()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2-300, 50, room_width/2+300, room_height-50, false);
	draw_set_color(c_white);
}

function scr_close()
{
	draw_set_color(c_ltgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, true);
	draw_set_color(c_dkgray);
	draw_rectangle(room_width/2+302, 50, room_width/2+322, 70, false);
	draw_set_color(c_white);
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), room_width/2+302, 50, room_width/2+322, 70))
	{
		draw_set_color(c_gray);
		draw_rectangle(room_width/2+305, 53, room_width/2+319, 67, false);
		draw_set_color(c_white);
		if (mouse_check_button_pressed(mb_left))
		{
			instance_destroy();
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(room_width/2+312, 60, "X")
	draw_set_valign(-1);
	draw_set_halign(-1);
}