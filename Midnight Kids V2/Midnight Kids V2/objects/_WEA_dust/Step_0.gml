if wooble_dir == "left" {
	x -= _xspd;
	//x = lerp(x,x1,0.3);
	wooble += random_range(0.2,1);
}
else if wooble_dir == "right" {
	//x = lerp(x,x1,0.3);
	x += _xspd;
	wooble += random_range(0.2,1);
}
if wooble > wooble_max{
	if wooble_dir == "left" {wooble_dir = "right"; wooble = 0;}
	else if wooble_dir == "right"{wooble_dir = "left"; wooble = 0;}
}
y += _yspd;

if !trigger {
	if image_alpha < _alpha image_alpha += 0.001;
	else trigger = true;
}
if trigger image_alpha -= 0.01;
if x<0 or y>room_height or (trigger and image_alpha <= 0.009) instance_destroy();
