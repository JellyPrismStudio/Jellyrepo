//if (live_call()) return live_result;
draw_self();
depth = -y+camera_get_view_y(view_camera[0]);

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _w = camera_get_view_width(view_camera[0]);
var _h = camera_get_view_height(view_camera[0]);
if (x == clamp(x, _x-sprite_width/2, _x+_w+sprite_width/2) and
y == clamp(y, _y-sprite_height, _y+_h+sprite_width*2))
{
	if keyboard_check(vk_f5){
		draw_set_font(Font1);

		var unkw = 17
		var alpha = 0.2

		if image_index > 40
		{
			var c_color = c_red
			draw_text_color(x, y - 70, image_index+1, c_color, c_color, c_color, c_color, alpha);
		}
		else if image_index > 30
		{
			var c_color = c_blue
			draw_text_color(x, y - 70, image_index+1, c_color, c_color, c_color, c_color, alpha);
		}
		else if image_index > 20
		{
			var c_color = c_green
			draw_text_color(x, y - 70, image_index+1, c_color, c_color, c_color, c_color, alpha);
		}
		else if image_index > 10
		{
			var c_color = c_orange
			draw_text_color(x, y - 70, image_index+1, c_color, c_color, c_color, c_color, alpha);
		}
		else if image_index > 0
		{
			var c_color = c_white
			draw_text_color(x, y - 70, image_index+1, c_color, c_color, c_color, c_color, alpha);
		}
		
		image_blend = c_color;
	}

	if (vida < vida_max)
	{
		draw_healthbar(x-20, y-80, x+20, y-70, vida%vida_max, c_black, c_red, c_lime, 0, true, true);
		if (timer > 0) timer--;
		if (timer == 0)
		{
			vida++;
			if (vida == vida_max) timer = timer_max;
		}
	}
}

event_inherited();