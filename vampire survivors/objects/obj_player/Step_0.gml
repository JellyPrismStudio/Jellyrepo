var w = keyboard_check(ord("W"));
var a = keyboard_check(ord("A"));
var s = keyboard_check(ord("S"));
var d = keyboard_check(ord("D"));
var vlh = d-a;
var vlv = s-w;
if (abs(vlh)+abs(vlv) != 0)
{
	hsped = lerp(hsped, lengthdir_x(sped, point_direction(x, y, x+vlh, y+vlv)), .3);
	vsped = lerp(vsped, lengthdir_y(sped, point_direction(x, y, x+vlh, y+vlv)), .3);
}
if (abs(vlh)+abs(vlv) == 0)
{
	hsped = 0;
	vsped = 0;
}

x += hsped;
y += vsped;

gun.x = x+lengthdir_x(50, point_direction(x, y, mouse_x, mouse_y));
gun.y = y+lengthdir_y(50, point_direction(x, y, mouse_x, mouse_y));
gun.image_angle = point_direction(x, y, mouse_x, mouse_y);
gun.image_yscale = gun.x < x? -1 : 1;