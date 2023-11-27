x += lengthdir_x(8, dir);
y += lengthdir_y(8, dir);

if (place_meeting(x, y, colisor) or place_meeting(x, y, oENM_Main) or x != clamp(x, 0, room_width) or y != clamp(y, 0, room_height))
{
	instance_destroy();
}