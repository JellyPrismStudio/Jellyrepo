f_fundo = function()
{
	draw_set_color(c_maroon);
	draw_rectangle(view_wport[0]/4, view_hport[0]/3.5, view_wport[0]/1.25, view_hport[0]/1.28, false);
	draw_set_color(c_ltgray);
	draw_rectangle(view_wport[0]/4, view_hport[0]/3.5, view_wport[0]/1.25, view_hport[0]/1.28, true);
	draw_rectangle(view_wport[0]/4+1, view_hport[0]/3.5+1, view_wport[0]/1.25-1, view_hport[0]/1.28-1, true);
	draw_rectangle(view_wport[0]/4+2, view_hport[0]/3.5+2, view_wport[0]/1.25-2, view_hport[0]/1.28-2, true);
	draw_set_color(c_white);	
}

f_botoes = function()
{
	for (var i = 0; i < 3; i++;)
	{
		var _dis = 10;
		var _color = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis, view_hport[0]/3.5+_dis,
		view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis)? c_white : c_gray;
		
		draw_set_color(_color);
		draw_rectangle(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis, view_hport[0]/3.5+_dis,
		view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis, true);
		
		_dis = 11;
		draw_rectangle(view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*i+_dis, view_hport[0]/3.5+_dis,
		view_wport[0]/4+(view_wport[0]/1.25-view_wport[0]/4)/3*(i+1)-_dis, view_hport[0]/1.28-_dis, true);
		draw_set_color(c_white);
	}
}