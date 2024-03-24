if keyboard_check(vk_numpad8) { y--; lockcamera = false }
if keyboard_check(vk_numpad4) { x--; lockcamera = false }
if keyboard_check(vk_numpad2) { y++; lockcamera = false }
if keyboard_check(vk_numpad6) { x++; lockcamera = false }
if keyboard_check_pressed(vk_numpad5) { lockcamera = !lockcamera }


if lockcamera == true
{
	x = obj_player.x;
	y = obj_player.y;
}