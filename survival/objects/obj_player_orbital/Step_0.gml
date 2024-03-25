if keyboard_check(vk_up) { y--; lockcamera = false }
if keyboard_check(vk_left) { x--; lockcamera = false }
if keyboard_check(vk_down) { y++; lockcamera = false }
if keyboard_check(vk_right) { x++; lockcamera = false }
if keyboard_check_pressed(vk_enter) { lockcamera = !lockcamera }


if lockcamera == true
{
	x = obj_player.x;
	y = obj_player.y;
}