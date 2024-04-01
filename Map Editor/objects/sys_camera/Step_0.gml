vel = 3;


if keyboard_check(ord("W")) y -= vel;
if keyboard_check(ord("S")) y += vel;

if keyboard_check(ord("D")) x += vel;
if keyboard_check(ord("A")) x -= vel;

if keyboard_check_pressed(vk_space)
{
	capture_and_save_room_screenshot()
}

if keyboard_check_pressed(vk_alt) load_graphic();

