x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

if effect == "out"
{
	if image_alpha >= 1 - spd/100 finished2 = true
	image_alpha += spd/100;	
	
}
if effect == "in"
{
	if image_alpha <= 0 + spd/100 finished1 = true
	image_alpha -= spd/100;	
	
}
//sdm("obj:",id,finished1, finished2);