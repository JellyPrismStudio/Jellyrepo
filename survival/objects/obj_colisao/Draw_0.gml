//if (live_call()) return live_result;

draw_self();

/*
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