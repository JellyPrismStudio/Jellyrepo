if to_gamepad_pressed(mb_left)
{
	des_x = mouse_x;
	des_y = mouse_y;
	pos_x = x;
	pos_y = y;
	pos = 0;
}
if pos < 1 pos += 0.05;

val = animcurve_channel_evaluate(curve, pos);
val2 = animcurve_channel_evaluate(curve2, pos);

var dist_x = des_x - pos_x;
var dist_y = des_y - pos_y;

x = pos_x + (dist_x * val2);
y = pos_y + (dist_y * val);