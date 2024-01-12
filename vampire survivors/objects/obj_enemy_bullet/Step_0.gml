x += lengthdir_x(sped, image_angle);
y += lengthdir_y(sped, image_angle);

if (x != clamp(x, 0, room_width) or y != clamp(y, 0, room_height)) instance_destroy();
if (place_meeting(x, y, obj_player))
{
	instance_destroy();
	obj_player.vida--;
}